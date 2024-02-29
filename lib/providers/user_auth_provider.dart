import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserAuthProvider with ChangeNotifier {
  //TODO MI usuario solo tiene el token pero debe empezar con beare arreglalo
  
  //VALUES FROM USER
  String tokenUser = "";
  setTokenUser(String token) {
    tokenUser = token;
    notifyListeners();
  }

  getTokenUser() {
    return tokenUser;
  }

  String fullNameUser = "L";
  String phoneUser = "";
  String emailUser = "";

  Future<bool> verifyLogin(String email, String password) async {
    // URL de la API de inicio de sesión
    const String apiUrl = 'https://dev.ktel.pe/api/login';

    // Cuerpo de la solicitud con los parámetros de inicio de sesión
    final Map<String, String> data = {
      'email': email,
      'password': password,
    };

    try {
      final http.Response response = await http.post(
        Uri.parse(apiUrl),
        body: data,
      );
      if (response.statusCode == 200) {
        tokenUser = json.decode(response.body)['token'] as String;
        notifyListeners();
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  // TODO añadir change notifiers!!!!!

  //logout
  Future<void> logOutUser() async {
    const String apiUrl = 'https://dev.ktel.pe/api/logout';
    try {
      http.Request request = http.Request('POST', Uri.parse(apiUrl));
      request.headers['Authorization'] = 'Bearer ${tokenUser}';
      http.StreamedResponse response = await request.send();
      notifyListeners();

      if (response.statusCode == 200) {
        print('Logout exitoso');
      } else {
        print('Error en el logout: ${response.statusCode}');
      }
    } catch (e) {
      print('Error en el logout: $e');
    }
  }

  //edit info
  Future<void> updateInfoUser(name, phone, email) async {
    const String apiUrl = 'https://dev.ktel.pe/api/update-user-info';
    Map<String, dynamic> requestBody = {
      'name': name,
      'phone': phone,
      'email': email,
    };
    String requestBodyJson = jsonEncode(requestBody);
    notifyListeners();
    try {
      http.Request request = http.Request('POST', Uri.parse(apiUrl));
      request.headers['Authorization'] = 'Bearer ${tokenUser}';
      request.headers['Content-Type'] = 'application/json';
      request.body = requestBodyJson;

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print("Datos actualizos con éxito");
        print(name);
        print(phone);
        print(email);
      } else {
        print("Error en la solicitud: ${response.statusCode}");
      }
    } catch (e) {
      print("Error en la solicitud aqui: $e");
    }
  }

  //getInfoUser
  Future<void> getInfoUser() async {
    const String apiUrl = 'https://dev.ktel.pe/api/user-info';
    try {
      http.Request request = http.Request('POST', Uri.parse(apiUrl));
      request.headers['Authorization'] = 'Bearer ${tokenUser}';
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String responseBody = await response.stream.bytesToString();
        Map<String, dynamic> userInfo = jsonDecode(responseBody);
        print(userInfo);
        fullNameUser = userInfo['name'];
        phoneUser = userInfo['phone'];
        emailUser = userInfo['email'];
        notifyListeners();

        print(fullNameUser);
        print(phoneUser);
        print(emailUser);
      } else {
        print("Error en la solicitud: ${response.statusCode}");
      }
    } catch (e) {
      print("Error en la solicitud aqui: $e");
    }
  }

  //RegisterUser
  Future<bool> registerUser(
      String email, String password, String fullName, String phone) async {
    // URL del endpoint
    const String apiUrl = 'https://dev.ktel.pe/api/register';

    // Cuerpo de la solicitud HTTP
    final Map<String, String> data = {
      "name": fullName,
      "email": email,
      "password": password,
      "password_confirmation": password,
      "phone": phone,
    };

    print(data);

    // Realizar la solicitud HTTP
    try {
      final http.Response response = await http.post(
        Uri.parse(apiUrl),
        body: data,
      );
      if (response.statusCode == 201) {
        tokenUser = json.decode(response.body)['token'] as String;
        notifyListeners();
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("error $e");
      return false;
    }
  }
}

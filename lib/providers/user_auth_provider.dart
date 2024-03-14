import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserAuthProvider with ChangeNotifier {
  //!ESTOY USANDO UN BEARER KEY POR EL MOMENTO
  String _tokenUser = "236|36sVm1hzmQJbMW9CLOERq1QXBDhRSJbkNUlCAYli2d847f2b";
  // String _tokenUser = "";
  String fullNameUser = "L";
  String phoneUser = "";
  String emailUser = "";

  setTokenUser(String token) {
    _tokenUser = token;
    notifyListeners();
  }

  getTokenUser() {
    return _tokenUser;
  }

  Future<bool> verifyLogin(String email, String password) async {
    const String apiUrl = 'https://dev.ktel.pe/api/login';
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
        _tokenUser = json.decode(response.body)['token'] as String;
        notifyListeners();
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  //logout
  Future<void> logOutUser() async {
    const String apiUrl = 'https://dev.ktel.pe/api/logout';
    try {
      http.Request request = http.Request('POST', Uri.parse(apiUrl));
      request.headers['Authorization'] = 'Bearer $_tokenUser';
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

  Future<void> updateInfoUser(name, phone, email) async {
    const String apiUrl = 'https://dev.ktel.pe/api/update-user-info';
    Map<String, dynamic> requestBody = {
      'name': name,
      'phone': phone,
      'email': email,
    };
    String requestBodyJson = jsonEncode(requestBody);
    try {
      http.Request request = http.Request('POST', Uri.parse(apiUrl));
      request.headers['Authorization'] = 'Bearer $_tokenUser';
      request.headers['Content-Type'] = 'application/json';
      request.body = requestBodyJson;
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        fullNameUser = name;
        phoneUser = phone;
        emailUser = email;
        notifyListeners();
      } else {
        print("Error en la solicitud: ${response.statusCode}");
      }
    } catch (e) {
      print("Error en la solicitud aqui: $e");
    }
  }

  Future<void> getInfoUser() async {
    const String apiUrl = 'https://dev.ktel.pe/api/user-info';
    try {
      http.Request request = http.Request('POST', Uri.parse(apiUrl));
      request.headers['Authorization'] = 'Bearer ${_tokenUser}';
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String responseBody = await response.stream.bytesToString();
        Map<String, dynamic> userInfo = jsonDecode(responseBody);
        print(userInfo);
        fullNameUser = userInfo['name'];
        phoneUser = userInfo['phone'];
        emailUser = userInfo['email'];
        notifyListeners();
      } else {
        print("Error en la solicitud: ${response.statusCode}");
      }
    } catch (e) {
      print("Error en la solicitud aqui: $e");
    }
  }

  Future<bool> registerUser(
      String email, String password, String fullName, String phone) async {
    const String apiUrl = 'https://dev.ktel.pe/api/register';

    final Map<String, String> data = {
      "name": fullName,
      "email": email,
      "password": password,
      "password_confirmation": password,
      "phone": phone,
    };
    try {
      final http.Response response = await http.post(
        Uri.parse(apiUrl),
        body: data,
      );
      if (response.statusCode == 201) {
        _tokenUser = json.decode(response.body)['token'] as String;
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

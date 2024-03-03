import 'dart:convert';
import 'package:ascensores/providers/user_auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

Future<dynamic> getInfoOfTraficStudyById(
    String id, BuildContext context) async {
  String apiUrl = 'https://dev.ktel.pe/api/elevator-calculations/$id';
  final myToken =
      Provider.of<UserAuthProvider>(context, listen: false).getTokenUser();
  try {
    http.Response response = await http
        .get(Uri.parse(apiUrl), headers: {'Authorization': 'Bearer $myToken'});
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    }
  } catch (e) {
    print('Error en el getInfoOfTraficStudyById() $e');
  }
}

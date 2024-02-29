import 'package:flutter/material.dart';

class UserAuthProvider with ChangeNotifier {
  //VALUES FROM USER
  String tokenUser = "";
  setTokenUser(String token) {
    tokenUser = token;
    notifyListeners();
  }

  getTokenUser() {
    return tokenUser;
  }
}

import 'package:flutter/material.dart';
import 'package:ascensores/screens/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inicio de sesión',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          // Replace with your desired color
        ),
      ),
      home: const LoginPage(),
    );
  }
}

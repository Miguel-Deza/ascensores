import 'package:ascensores/screens/home_screen.dart';
import 'package:flutter/material.dart';
// import 'package:ascensores/screens/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inicio de sesión',
      theme: ThemeData.dark().copyWith(
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(color: Colors.white),
          fillColor: Colors.white,
          iconColor: Colors.white,
          hintStyle: TextStyle(color: Colors.white),
          focusColor: Colors.white,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
        unselectedWidgetColor: Colors.white,
        scaffoldBackgroundColor: const Color(0xFF175B96),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          onPrimary:
              Colors.white, // Set text color for buttons with primary color
        ),
      ),

      home: const HomeScreen(
        token: "Bearer 121|yMUrgpuTXP7JIsXcbSRbnYOqOVM7x3pMAftUHjAxa3bd9977",
      ), // Usar solo el tema oscuro
    );
  }
}

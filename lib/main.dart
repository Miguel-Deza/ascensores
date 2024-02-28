import 'package:ascensores/providers/duct_form_provider.dart';
import 'package:ascensores/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DuctFormProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inicio de sesión',
      theme: AppTheme.darkTheme, // Usar solo el tema oscuro
      home: const HomeScreen(
        token: "Bearer 134|bhBFZWzmqN4Urxeki7TzCC53uEBn1gP6dpdwp8Fz1ae020b0",
      ),
    );
  }
}

class AppTheme {
  static final ThemeData darkTheme = ThemeData.dark().copyWith(
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
      onPrimary: Colors.white, // Set text color for buttons with primary color
    ),
  );
}

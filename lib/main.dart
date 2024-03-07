import 'package:ascensores/providers/duct_form_provider.dart';
import 'package:ascensores/providers/user_auth_provider.dart';
import 'package:ascensores/screens/duct_calculation.dart';
import 'package:ascensores/screens/duct_calculation/duct_calculation_page.dart';
import 'package:ascensores/screens/elevator_sizing_screen.dart';
import 'package:ascensores/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:ascensores/screens/home_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DuctFormProvider()),
        ChangeNotifierProvider(create: (_) => UserAuthProvider()),
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
      theme: ThemeData(
        colorSchemeSeed: Colors.blueAccent,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.orange[900]),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
        ),
      ),
      title: 'Inicio de sesión',
      home: ElevatorSizingScreen(),
    );
  }
}

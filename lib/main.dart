import 'package:ascensores/input_select_dimentions.dart';
import 'package:ascensores/providers/user_auth_provider.dart';
import 'package:ascensores/screens/create_project_page/duct_design_screen.dart';
import 'package:ascensores/screens/create_project_page/duct_plane_screen.dart';
import 'package:ascensores/screens/create_project_page/get_general_data_screen.dart';
import 'package:ascensores/screens/create_project_page/study_trafic_screen_form.dart';
import 'package:ascensores/screens/extras/projects_page_screen.dart';
import 'package:ascensores/screens/home_screen/home_screen.dart';
import 'package:ascensores/screens/trafic_study/trafic_study_page/study_screen_2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
// import 'package:ascensores/screens/home_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
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
      supportedLocales: [
        const Locale('es', 'ES'),
      ],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        FormBuilderLocalizations.delegate,
      ],
      home: GetGeneralDataScreen(),
      theme: ThemeData(
        colorSchemeSeed: Colors.blueAccent,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.orange[900]),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
        ),
      ),
    );
  }
}

import 'dart:convert';

import 'package:ascensores/providers/user_auth_provider.dart';
import 'package:ascensores/screens/bottom/calculation_history_page.dart';
import 'package:ascensores/screens/bottom/trafic_study/trafic_study_page.dart';
import 'package:ascensores/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:ascensores/screens/bottom/duct_calculation/duct_calculation_page.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? fullName;
  String? phone;
  String? email;

  final List<Widget> _pages = <Widget>[
    const DuctCalculationPage(),
    const TraficStudyPage(),
    const CalculationHistoryPage(),
    // const CotizationPricesPage(),
  ];
  @override
  void initState() {
    super.initState();
    context.read<UserAuthProvider>().getInfoUser();
    // getInfoUser();
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _showUserDataDialog(BuildContext context) {
    var userInfo = context.read<UserAuthProvider>();
    TextEditingController nameController =
        TextEditingController(text: userInfo.fullNameUser);
    TextEditingController phoneController =
        TextEditingController(text: userInfo.phoneUser);
    TextEditingController emailController =
        TextEditingController(text: userInfo.emailUser);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Mis Datos'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Nombre'),
                ),
                TextFormField(
                  controller: phoneController,
                  decoration: const InputDecoration(labelText: 'Teléfono'),
                ),
                TextFormField(
                  controller: emailController,
                  decoration:
                      const InputDecoration(labelText: 'Correo electrónico'),
                ),
                const SizedBox(height: 20),
                const Text('Correo validado: Sí'),
              ],
            ),
          ),
          actions: <Widget>[
            // TextButton(
            //   onPressed: () {
            //     // Implementar la acción de validar correo
            //   },
            //   child: const Text('Validar correo'),
            // ),
            TextButton(
              onPressed: () async {
                await context.read<UserAuthProvider>().updateInfoUser(
                      nameController.text,
                      phoneController.text,
                      emailController.text,
                    );
                setState(() {
                  fullName = nameController.text;
                  phone = phoneController.text;
                  email = emailController.text;
                });
                if (context.mounted) Navigator.of(context).pop();
              },
              child: const Text('Guardar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserAuthProvider>(
      builder: (context, valueProvider, child) => Scaffold(
        body: SafeArea(
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              _pages[_selectedIndex],
              Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    iconSize: 40.0,
                    icon: const Icon(Icons.account_circle),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  );
                },
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                decoration: const BoxDecoration(
                  color: Color(0xFF155a96),
                ),
                accountName: Text(valueProvider.fullNameUser ?? 'Cargando...'),
                accountEmail: Text(valueProvider.emailUser ?? 'Cargando...'),
                currentAccountPicture: CircleAvatar(
                  //TODO, at the beginning the user is null so it produces an error, fix it in auth provider
                  child: Text(valueProvider.fullNameUser[0].toUpperCase()),
                ),
              ),
              ListTile(
                title: const Text('Mis Datos'),
                onTap: () {
                  _showUserDataDialog(context);
                },
              ),
              ListTile(
                title: const Text('Salir'),
                onTap: () async {
                  await valueProvider.logOutUser();
                  if (mounted) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                      (Route<dynamic> route) => false,
                    );
                  }
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.straighten),
              label: '  Cálculo\nde ductos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.traffic),
              label: '  Estudio\nde tráfico',
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.attach_money),
            //   label: 'Cotizaciones',
            // ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'Historial',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

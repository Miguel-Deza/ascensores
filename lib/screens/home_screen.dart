import 'dart:convert';

import 'package:ascensores/screens/bottom/trafic_study_page.dart';
import 'package:ascensores/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:ascensores/screens/bottom/duct_calculation/duct_calculation_page.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  final String token;

  const HomeScreen({
    Key? key,
    required this.token,
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
    const CotizationPricesPage(),
  ];
  @override
  void initState() {
    super.initState();
    // Llamar a la función getInfoUser() al inicializar el widget
    getInfoUser();
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _showUserDataDialog(BuildContext context) {
    TextEditingController nameController =
        TextEditingController(text: fullName);
    TextEditingController phoneController = TextEditingController(text: phone);
    TextEditingController emailController = TextEditingController(text: email);

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
            TextButton(
              onPressed: () {
                // Implementar la acción de validar correo
              },
              child: const Text('Validar correo'),
            ),
            TextButton(
              onPressed: () async {
                await updateInfoUser(
                  nameController.text,
                  phoneController.text,
                  emailController.text,
                );
                setState(() {
                  fullName = nameController.text;
                  phone = phoneController.text;
                  email = emailController.text;
                });
                Navigator.of(context).pop();
              },
              child: const Text('Guardar'),
            ),
          ],
        );
      },
    );
  }

  Future<void> LogOutUser() async {
    const String apiUrl = 'https://dev.ktel.pe/api/logout';
    try {
      http.Request request = http.Request('POST', Uri.parse(apiUrl));
      request.headers['Authorization'] = 'Bearer ${widget.token}';
      http.StreamedResponse response = await request.send();

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
      request.headers['Authorization'] = 'Bearer ${widget.token}';
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

  Future<void> getInfoUser() async {
    const String apiUrl = 'https://dev.ktel.pe/api/user-info';
    try {
      http.Request request = http.Request('POST', Uri.parse(apiUrl));
      request.headers['Authorization'] = 'Bearer ${widget.token}';
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String responseBody = await response.stream.bytesToString();
        Map<String, dynamic> userInfo = jsonDecode(responseBody);
        print(userInfo);
        setState(() {
          fullName = userInfo['name'];
          phone = userInfo['phone'];
          email = userInfo['email'];
        });
        print(fullName);
        print(phone);
        print(email);
      } else {
        print("Error en la solicitud: ${response.statusCode}");
      }
    } catch (e) {
      print("Error en la solicitud aqui: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              accountName: Text(fullName ?? 'Cargando...'),
              accountEmail: Text(email ?? 'Cargando...'),
              currentAccountPicture: CircleAvatar(
                child: Text(fullName != null ? fullName![0] : "L"),
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
                await LogOutUser();
                if (mounted) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
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
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Historial',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'Cotizaciones',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}



class CalculationHistoryPage extends StatelessWidget {
  const CalculationHistoryPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Página de Historial de Cálculos'),
    );
  }
}

class CotizationPricesPage extends StatelessWidget {
  const CotizationPricesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Página de Cotizaciones b'),
    );
  }
}

import 'package:ascensores/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:ascensores/screens/calculation/get_data_screen.dart';

class HomeScreen extends StatefulWidget {
  String email;
  String newPassword;
  String phone;
  String fullName;

  HomeScreen({
    Key? key,
    required this.email,
    required this.newPassword,
    required this.phone,
    required this.fullName,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  String fullName = '';
  String phone = '';
  String email = '';

  int _selectedIndex = 0;

  final List<Widget> _pages = <Widget>[
    const TrafficStudiesPage(),
    const DuctCalculationPage(),
    const CalculationHistoryPage(),
    const CotizationPricesPage(),
  ];

  final bool _isEmailValidated = false;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xFF155a96),
              ),
              accountName: Text(widget.fullName),
              accountEmail: Text(widget.email),
              currentAccountPicture: CircleAvatar(
                child: Text(
                  widget.fullName[0],
                ),
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
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                  (Route<dynamic> route) => false,
                );
              },
            ),
          ],
        ),
      ),
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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.traffic),
            label: '  Estudio\nde tráfico',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.straighten),
            label: '  Cálculo\nde ductos',
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

  void _showUserDataDialog(BuildContext context) {
    TextEditingController nameController =
        TextEditingController(text: widget.fullName);
    TextEditingController phoneController =
        TextEditingController(text: widget.phone);
    TextEditingController emailController =
        TextEditingController(text: widget.email);

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
                Text('Correo validado: ${_isEmailValidated ? 'Sí' : 'No'}'),
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
              onPressed: () {
                setState(() {
                  widget.fullName = nameController.text;
                  widget.phone = phoneController.text;
                  widget.email = emailController.text;
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
}

class TrafficStudiesPage extends StatelessWidget {
  const TrafficStudiesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Página de Estudios de Tráfico'),
    );
  }
}

class DuctCalculationPage extends StatelessWidget {
  const DuctCalculationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetDataScreen();
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
      child: Text('Página de Cotizaciones'),
    );
  }
}

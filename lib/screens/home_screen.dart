import 'package:ascensores/screens/login_page.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = <Widget>[
    const TrafficStudiesPage(),
    const DuctCalculationPage(),
    const CalculationHistoryPage(),
    const CotizationPricesPage(),
  ];

  // Datos del usuario
  String _userName = 'John Doe';
  String _userPhone = '123-456-7890';
  String _userEmail = 'johndoe@example.com';
  bool _isEmailValidated =
      false; // Cambia a false si el correo no está validado

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
              accountName: Text(_userName),
              accountEmail: Text(_userEmail),
              currentAccountPicture: CircleAvatar(
                child: Text(
                  _userName[0],
                ), // Mostrar la inicial del nombre como imagen de perfil
              ),
            ),
            ListTile(
              title: Text('Mis Datos'),
              onTap: () {
                _showUserDataDialog(context);
              },
            ),
            ListTile(
              title: Text('Salir'),
              onTap: () {
                // Implementar la acción de salir
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
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
                  icon: Icon(Icons.account_circle),
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
            label: ' Estudios\nde tráfico',
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
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Mis Datos'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Nombre: $_userName'),
              Text('Teléfono: $_userPhone'),
              Text('Correo electrónico: $_userEmail'),
              Text('Correo validado: ${_isEmailValidated ? 'Sí' : 'No'}'),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Implementar la acción de editar datos
              },
              child: const Text('Validar correo'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }
}

// Reemplaza estas páginas con el contenido específico de cada sección
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
    return const Center(
      child: Text('Página de Cálculo de Ductos'),
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
      child: Text('Página de Cotizaciones'),
    );
  }
}

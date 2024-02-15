import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(
        width: 250,
        child: Drawer(
            child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('Actualizar datos'),
              onTap: () {
                // Implementar la acción de actualizar datos
              },
            ),
            ListTile(
              title: Text('Actualizar correo'),
              onTap: () {
                // Implementar la acción de actualizar correo
              },
            ),
            ListTile(
              title: Text('Validar correo electrónico'),
              onTap: () {
                // Implementar la acción de validar correo electrónico
              },
            ),
          ],
        )),
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
            label: 'Estudios de tráfico',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.straighten),
            label: 'Cálculo de ductos',
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

// Reemplaza estas páginas con el contenido específico de cada sección
class TrafficStudiesPage extends StatelessWidget {
  const TrafficStudiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Página de Cálculo de Ductos'),
    );
  }
}

class DuctCalculationPage extends StatelessWidget {
  const DuctCalculationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Página de Cálculo de Ductos'),
    );
  }
}

class CalculationHistoryPage extends StatelessWidget {
  const CalculationHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Página de Historial de Cálculos'),
    );
  }
}

class CotizationPricesPage extends StatelessWidget {
  const CotizationPricesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Página de Historial de Cálculos'),
    );
  }
}

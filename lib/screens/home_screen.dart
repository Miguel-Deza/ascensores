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
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
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
            label: 'Historial de cálculos',
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
      child: Text('Página de Estudios de Tráfico'),
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

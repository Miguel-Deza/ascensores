import 'package:ascensores/screens/projects_page/admin_page/admin_screen.dart';
import 'package:ascensores/screens/projects_page/confirmation_order_page/confirmation_order_screen.dart';
import 'package:ascensores/screens/projects_page/init_end_page/init_end_screen.dart';
import 'package:flutter/material.dart';

class ProjectsPageScreen extends StatelessWidget {
  const ProjectsPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Proyectos'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                text: "Administrador",
              ),
              Tab(
                text: "Confirmación",
              ),
              Tab(
                text: "Inicio - Fin",
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            AdminScreen(),
            ConfirmationOrderScreen(),
            InitEndScreen(),
          ],
        ),
      ),
    );
  }
}

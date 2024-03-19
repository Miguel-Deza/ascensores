import 'package:flutter/material.dart';

class InitEndScreen extends StatelessWidget {
  const InitEndScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const Text("Pendientes de observación",
              style: TextStyle(fontSize: 20)),
          Card(
            child: ListTile(
              title: const Text("Observación 1"),
              subtitle: const Text("Observación 1"),
              trailing: const Icon(Icons.more_vert),
            ),
          ),
          Card(
            child: ListTile(
              title: const Text("Observación 1"),
              subtitle: const Text("Observación 1"),
              trailing: const Icon(Icons.more_vert),
            ),
          ),
          Card(
            child: ListTile(
              title: const Text("Observación 1"),
              subtitle: const Text("Observación 1"),
              trailing: const Icon(Icons.more_vert),
            ),
          ),
          const Text(
            "Otros",
            style: TextStyle(fontSize: 20),
          ),
          Card(
            child: ListTile(
              title: const Text("Observación 1"),
              subtitle: const Text("Observación 1"),
              trailing: const Icon(Icons.more_vert),
            ),
          ),
          Card(
            child: ListTile(
              title: const Text("Observación 1"),
              subtitle: const Text("Observación 1"),
              trailing: const Icon(Icons.more_vert),
            ),
          ),
        ],
      ),
    );
  }
}

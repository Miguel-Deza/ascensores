import 'package:ascensores/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

class ResultsStudyScreen extends StatelessWidget {
  final Map<String, dynamic> data;
  const ResultsStudyScreen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage("images/fondo.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.1), BlendMode.dstATop),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Center(
                  child: Text(
                    'Datos del estudio',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                DataTable(
                  dataRowMaxHeight: double.infinity,
                  columns: const [
                    DataColumn(label: Text('Variable')),
                    DataColumn(label: Text('Valor')),
                  ],
                  rows: [
                    DataRow(cells: [
                      const DataCell(
                          Text('Índice para calcular la población:')),
                      DataCell(
                        Text(
                          data["index"],
                        ),
                      ),
                    ]),
                    DataRow(cells: [
                      const DataCell(Text('Nro de Plantas:')),
                      DataCell(Text(data["floors"])),
                    ]),
                    DataRow(cells: [
                      const DataCell(Text(
                          'Porcentaje de población a transportar en 5 minutos:')),
                      DataCell(Text('${data["percentage"]}%')),
                    ]),
                    DataRow(cells: [
                      const DataCell(Text('Población total:')),
                      DataCell(Text('${data["total_population"]}')),
                    ]),
                    DataRow(cells: [
                      const DataCell(Text('Población servida:')),
                      DataCell(Text('${data["served_population"]}')),
                    ]),
                    DataRow(cells: [
                      const DataCell(Text('Pisos servidos:')),
                      DataCell(Text('${data["served_floors"]}')),
                    ]),
                    DataRow(cells: [
                      const DataCell(Text('Detenciones Probables:')),
                      DataCell(Text('${data["probable_stops"]}')),
                    ]),
                    DataRow(cells: [
                      const DataCell(Text('Salto promedio:')),
                      DataCell(
                        Text(
                          double.parse(data["average_jump"].toString())
                              .toStringAsFixed(2),
                        ),
                      ),
                    ]),
                  ],
                ),
                const Center(
                  child: Text(
                    'Datos del tiempo',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                DataTable(
                  dataRowMaxHeight: double.infinity,
                  columns: const [
                    DataColumn(label: Text('Variable')),
                    DataColumn(label: Text('Valor')),
                  ],
                  rows: [
                    DataRow(cells: [
                      const DataCell(Text('tiempo Paradas parciales')),
                      // double.parse(valueProvider.averageJump).toStringAsFixed(2)
                      DataCell(Text(double.parse(
                              '${data["travel_time_for_partial_stops"]}')
                          .toStringAsFixed(2))),
                    ]),
                    DataRow(cells: [
                      const DataCell(Text('Tiempo en zona express:')),
                      DataCell(
                          Text('${data["travel_time_for_express_floors"]}')),
                    ]),
                    DataRow(cells: [
                      const DataCell(
                          Text('Tiempo de acel. y desacel simultaneos:')),
                      DataCell(Text(double.parse(
                              '${data["acceleration_and_deceleration_time"]}')
                          .toStringAsFixed(2))),
                    ]),
                    DataRow(cells: [
                      const DataCell(Text('Falsas detenciones:')),
                      DataCell(Text('${data["false_stops"]}')),
                    ]),
                    DataRow(cells: [
                      const DataCell(
                          Text('Tiempo de apertura y cierre de puertas:')),
                      DataCell(
                          Text('${data["door_opening_and_closing_time"]}')),
                    ]),
                    DataRow(cells: [
                      const DataCell(
                          Text('Tiempo de entrada y salida de pasajeros:')),
                      DataCell(
                          Text('${data["passenger_entry_and_exit_time"]}')),
                    ]),
                    DataRow(cells: [
                      const DataCell(Text('Tiempo de recuperación:')),
                      DataCell(Text('${data["recovery_time"]}')),
                    ]),
                    DataRow(cells: [
                      const DataCell(Text('Tiempo total:')),
                      DataCell(
                        Text(
                          double.parse('${data["total_time"]}')
                              .toStringAsFixed(2),
                        ),
                      ),
                    ]),
                  ],
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()),
                      (route) => false, // Elimina todas las rutas existentes
                    );
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    size: 24.0,
                  ),
                  label: Text('Volver'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

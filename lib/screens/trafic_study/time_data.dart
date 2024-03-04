import 'package:ascensores/providers/duct_form_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TimeData extends StatefulWidget {
  const TimeData({super.key});

  @override
  State<TimeData> createState() => _TimeDataState();
}

class _TimeDataState extends State<TimeData> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DuctFormProvider>(
      builder: (context, valueProvider, child) => Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/fondo.jpg"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.1), BlendMode.dstATop),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: const Text(
                    'Estudio de tiempos',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                Center(
                  child: DataTable(
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
                                valueProvider.travelTimeForPartialStops)
                            .toStringAsFixed(2))),
                      ]),
                      DataRow(cells: [
                        const DataCell(Text('Tiempo en zona express:')),
                        DataCell(
                            Text(valueProvider.travelTimeForExpressFloors)),
                      ]),
                      DataRow(cells: [
                        const DataCell(
                            Text('Tiempo de acel. y desacel simultaneos:')),
                        DataCell(Text(double.parse(
                                valueProvider.accelerationAndDecelerationTime)
                            .toStringAsFixed(2))),
                      ]),
                      DataRow(cells: [
                        const DataCell(Text('Falsas detenciones:')),
                        DataCell(Text(valueProvider.falseStops)),
                      ]),
                      DataRow(cells: [
                        const DataCell(
                            Text('Tiempo de apertura y cierre de puertas:')),
                        DataCell(Text(valueProvider.doorOpeningAndClosingTime)),
                      ]),
                      DataRow(cells: [
                        const DataCell(
                            Text('Tiempo de entrada y salida de pasajeros:')),
                        DataCell(Text(valueProvider.passengerEntryAndExitTime)),
                      ]),
                      DataRow(cells: [
                        const DataCell(Text('Tiempo de recuperación:')),
                        DataCell(Text(valueProvider.recoveryTime)),
                      ]),
                      DataRow(cells: [
                        const DataCell(Text('Tiempo total:')),
                        DataCell(
                          Text(
                            double.parse(valueProvider.totalTime)
                                .toStringAsFixed(2),
                          ),
                        ),
                      ]),
                    ],
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
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

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
      builder: (context, valueProvider, child) => Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: DataTable(
            columns: const [
              DataColumn(label: Text('Variable')),
              DataColumn(label: Text('Valor')),
            ],
            rows: [
              DataRow(cells: [
                DataCell(Text('tiempo Paradas parciales')),
                DataCell(Text(valueProvider.travelTimeForPartialStops)),
              ]),
              DataRow(cells: [
                DataCell(Text('Tiempo en zona express:')),
                DataCell(Text(valueProvider.travelTimeForExpressFloors)),
              ]),
              DataRow(cells: [
                DataCell(Text('Tiempo de acel. y desacel simultaneos:')),
                DataCell(Text(valueProvider.accelerationAndDecelerationTime)),
              ]),
              DataRow(cells: [
                DataCell(Text('Falsas detenciones:')),
                DataCell(Text(valueProvider.falseStops)),
              ]),
              DataRow(cells: [
                DataCell(Text('Tiempo de apertura y cierre de puertas:')),
                DataCell(Text(valueProvider.doorOpeningAndClosingTime)),
              ]),
              DataRow(cells: [
                DataCell(Text('Tiempo de entrada y salida de pasajeros:')),
                DataCell(Text(valueProvider.passengerEntryAndExitTime)),
              ]),
              DataRow(cells: [
                DataCell(Text('Tiempo de recuperación:')),
                DataCell(Text(valueProvider.recoveryTime)),
              ]),
              DataRow(cells: [
                DataCell(Text('Tiempo total:')),
                DataCell(Text(valueProvider.totalTime)),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}

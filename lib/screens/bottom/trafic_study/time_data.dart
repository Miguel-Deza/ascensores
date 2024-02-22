import 'package:flutter/material.dart';

class TimeData extends StatefulWidget {
  const TimeData({super.key});

  @override
  State<TimeData> createState() => _TimeDataState();
}

class _TimeDataState extends State<TimeData> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Center(
        child: DataTable(
          columns: const [
            DataColumn(label: Text('Variable')),
            DataColumn(label: Text('Valor')),
          ],
          rows: const [
            DataRow(cells: [
              DataCell(Text('Tiempo de recorrido total:')),
              DataCell(Text('35 minutos')),
            ]),
            DataRow(cells: [
              DataCell(Text('Tiempo en zona express:')),
              DataCell(Text('10 minutos')),
            ]),
            DataRow(cells: [
              DataCell(Text('Tiempo de acel. y desacel simultaneos:')),
              DataCell(Text('5 minutos')),
            ]),
            DataRow(cells: [
              DataCell(Text('Falsas detenciones:')),
              DataCell(Text('2')),
            ]),
            DataRow(cells: [
              DataCell(Text('Tiempo de apertura y cierre de puertas:')),
              DataCell(Text('3 minutos')),
            ]),
            DataRow(cells: [
              DataCell(Text('Tiempo de entrada y salida de pasajeros:')),
              DataCell(Text('10 minutos')),
            ]),
            DataRow(cells: [
              DataCell(Text('Tiempo de recuperación:')),
              DataCell(Text('2 minutos')),
            ]),
            DataRow(cells: [
              DataCell(Text('Tiempo total:')),
              DataCell(Text('67 minutos')),
            ]),
          ],
        ),
      ),
    );
  }
}

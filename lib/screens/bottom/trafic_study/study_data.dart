import 'package:flutter/material.dart';


class StudyData extends StatefulWidget {
  const StudyData({super.key});

  @override
  State<StudyData> createState() => _StudyDataState();
}

class _StudyDataState extends State<StudyData> {
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
              DataCell(Text('Índice para calcular la población:')),
              DataCell(Text('Ejemplo')),
            ]),
            DataRow(cells: [
              DataCell(Text('Nro de Plantas:')),
              DataCell(Text('5')),
            ]),
            DataRow(cells: [
              DataCell(
                  Text('Porcentaje de población a transportar en 5 minutos:')),
              DataCell(Text('80%')),
            ]),
            DataRow(cells: [
              DataCell(Text('Población total:')),
              DataCell(Text('10000')),
            ]),
            DataRow(cells: [
              DataCell(Text('Población servida:')),
              DataCell(Text('8000')),
            ]),
            DataRow(cells: [
              DataCell(Text('Pisos servidos:')),
              DataCell(Text('8')),
            ]),
            DataRow(cells: [
              DataCell(Text('Detenciones Probables:')),
              DataCell(Text('6')),
            ]),
            DataRow(cells: [
              DataCell(Text('Salto promedio:')),
              DataCell(Text('2.5')),
            ]),
          ],
        ),
      ),
    );
  }
}
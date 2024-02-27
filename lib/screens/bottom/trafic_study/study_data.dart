import 'package:ascensores/providers/duct_form_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StudyData extends StatefulWidget {
  const StudyData({super.key});

  @override
  State<StudyData> createState() => _StudyDataState();
}

class _StudyDataState extends State<StudyData> {
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
                DataCell(Text('Índice para calcular la población:')),
                DataCell(Text(valueProvider.index)),
              ]),
              DataRow(cells: [
                DataCell(Text('Nro de Plantas:')),
                DataCell(Text(valueProvider.floors)),
              ]),
              DataRow(cells: [
                DataCell(Text(
                    'Porcentaje de población a transportar en 5 minutos:')),
                DataCell(Text('${valueProvider.percentage}%')),
              ]),
              DataRow(cells: [
                DataCell(Text('Población total:')),
                DataCell(Text(valueProvider.totalPopulation)),
              ]),
              DataRow(cells: [
                DataCell(Text('Población servida:')),
                DataCell(Text(valueProvider.servedPopulation)),
              ]),
              DataRow(cells: [
                DataCell(Text('Pisos servidos:')),
                DataCell(Text(valueProvider.servedFloors)),
              ]),
              DataRow(cells: [
                DataCell(Text('Detenciones Probables:')),
                DataCell(Text(valueProvider.probableStops)),
              ]),
              DataRow(cells: [
                DataCell(Text('Salto promedio:')),
                DataCell(Text(valueProvider.averageJump)),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}

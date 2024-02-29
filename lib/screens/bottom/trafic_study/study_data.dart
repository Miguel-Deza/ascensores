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
        child: ListView(
          children: [
            Center(
              child: Column(
                children: [
                  const Text(
                    'Datos del estudio',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
                            valueProvider.index,
                          ),
                        ),
                      ]),
                      DataRow(cells: [
                        const DataCell(Text('Nro de Plantas:')),
                        DataCell(Text(valueProvider.floors)),
                      ]),
                      DataRow(cells: [
                        const DataCell(Text(
                            'Porcentaje de población a transportar en 5 minutos:')),
                        DataCell(Text('${valueProvider.percentage}%')),
                      ]),
                      DataRow(cells: [
                        const DataCell(Text('Población total:')),
                        DataCell(Text(valueProvider.totalPopulation)),
                      ]),
                      DataRow(cells: [
                        const DataCell(Text('Población servida:')),
                        DataCell(Text(valueProvider.servedPopulation)),
                      ]),
                      DataRow(cells: [
                        const DataCell(Text('Pisos servidos:')),
                        DataCell(Text(valueProvider.servedFloors)),
                      ]),
                      DataRow(cells: [
                        const DataCell(Text('Detenciones Probables:')),
                        DataCell(Text(valueProvider.probableStops)),
                      ]),
                      DataRow(cells: [
                        const DataCell(Text('Salto promedio:')),
                        DataCell(
                          Text(
                            double.parse(valueProvider.averageJump)
                                .toStringAsFixed(2),
                          ),
                        ),
                      ]),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

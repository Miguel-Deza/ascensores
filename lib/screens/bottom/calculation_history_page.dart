import 'dart:convert';

import 'package:ascensores/providers/duct_form_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class CalculationHistoryPage extends StatefulWidget {
  const CalculationHistoryPage({super.key});

  @override
  State<CalculationHistoryPage> createState() => _CalculationHistoryPageState();
}

class _CalculationHistoryPageState extends State<CalculationHistoryPage> {
  @override
  void initState() {
    super.initState();
    final myProvider = Provider.of<DuctFormProvider>(context, listen: false);
    myProvider.getDataTable();
    // getDataTable();
  }

  Future<void> getInfoOfTraficStudyById(String id) async {
    String apiUrl = 'https://dev.ktel.pe/api/elevator-calculations/$id';

    try {
      http.Response response = await http.get(Uri.parse(apiUrl), headers: {
        'Authorization':
            'Bearer 134|bhBFZWzmqN4Urxeki7TzCC53uEBn1gP6dpdwp8Fz1ae020b0'
      });

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data);
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return ListView(
              children: [
                AlertDialog(
                  title: Text("Información"),
                  content: Center(
                    child: DataTable(
                      columns: const [
                        DataColumn(label: Text('Variable')),
                        DataColumn(label: Text('Valor')),
                      ],
                      rows: data.entries.map<DataRow>((entry) {
                        return DataRow(cells: [
                          DataCell(
                              Container(width: 100, child: Text(entry.key))),
                          DataCell(Container(
                              width: 100, child: Text(entry.value.toString()))),
                        ]);
                      }).toList(),
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: Text("Cerrar"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ],
            );
          },
        );
      } else {
        print('Error en la petición: ${response.statusCode}');
      }
    } catch (e) {
      print('Error en el getDataTable: $e');
    }
  }

  List<DataRow> buildDataRows(DuctFormProvider valueProvider) {
    return valueProvider.dataTabla.map((dataItem) {
      return DataRow(cells: [
        DataCell(Text('${dataItem['created_at']}')),
        DataCell(Text('${dataItem['stops']}')),
        DataCell(Text('${dataItem['floors']}')),
        DataCell(Text('${dataItem['total_time']}')),
        DataCell(Row(
          children: [
            IconButton(
                icon: Icon(Icons.visibility),
                onPressed: () async {
                  await getInfoOfTraficStudyById(dataItem['id'].toString());
                  // Lógica para editar la fila 1
                }),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () async {
                await valueProvider
                    .deleteRowFromTable(dataItem['id'].toString());
                valueProvider.dataTabla
                    .removeWhere((item) => item['id'] == dataItem['id']);
              },
            ),
          ],
        )),
      ]);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DuctFormProvider>(
      builder: (context, valueProvider, child) => Padding(
        padding: const EdgeInsets.all(16),
        child: Scrollbar(
          thumbVisibility: true,
          thickness: 10,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Scrollbar(
              thumbVisibility: true,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('Fecha de creación')),
                    DataColumn(label: Text('Paradas')),
                    DataColumn(label: Text('Pisos')),
                    DataColumn(label: Text('Tiempo total')),
                    DataColumn(label: Text('Options')),
                  ],
                  rows: buildDataRows(valueProvider),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Future<void> getDataTable() async {
//   const String apiUrl = 'https://dev.ktel.pe/api/quotes';
//   try {
//     http.Response response = await http.get(Uri.parse(apiUrl), headers: {
//       'Authorization':
//           'Bearer 134|bhBFZWzmqN4Urxeki7TzCC53uEBn1gP6dpdwp8Fz1ae020b0'
//     });

//     if (response.statusCode == 200) {
//       Map<String, dynamic> data = jsonDecode(response.body);
//       setState(() {
//         _data = List<Map<String, dynamic>>.from(data.values);
//       });
//     } else {
//       print('Error en la petición: ${response.statusCode}');
//     }
//   } catch (e) {
//     print('Error en el getDataTable: $e');
//   }
// }

// Future<void> deleteRowQuote(int id) async {
//   final String apiUrl = 'https://dev.ktel.pe/api/quotes/$id';
//   try {
//     http.Response response = await http.delete(Uri.parse(apiUrl), headers: {
//       'Authorization':
//           'Bearer 134|bhBFZWzmqN4Urxeki7TzCC53uEBn1gP6dpdwp8Fz1ae020b0'
//     });

//     if (response.statusCode == 200) {
//       setState(() {
//         _data.removeWhere((item) => item['id'] == id);
//       });
//       print('Fila eliminada');
//     } else {
//       print('Error en la petición: ${response.statusCode}');
//     }
//   } catch (e) {
//     print('Error en el deleteRowQuote: $e');
//   }
// }
//////////////////////////////////////////////////////
/////////////////////////////////////////////////////////

// List<DataRow> buildDataRows() {
//     return _data.map((dataItem) {
//       return DataRow(cells: [
//         DataCell(Text('${dataItem['description']}')),
//         DataCell(Text('${dataItem['brand']}')),
//         DataCell(Text('${dataItem['model']}')),
//         DataCell(Text('${dataItem['project']}')),
//         DataCell(Text('${dataItem['created_at']}')),
//         DataCell(Text('En proceso')),
//         DataCell(Row(
//           children: [
//             IconButton(
//               icon: Icon(Icons.edit),
//               onPressed: () {
//                 // Lógica para editar la fila 1
//               },
//             ),
//             IconButton(
//               icon: Icon(Icons.delete),
//               onPressed: () async {
//                 setState(() {
//                   _data.removeWhere((item) => item['id'] == dataItem['id']);
//                 });
//                 await deleteRowQuote(dataItem['id']);
//               },
//             ),
//           ],
//         )),
//       ]);
//     }).toList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16),
//       child: Scrollbar(
//         thumbVisibility: true,
//         thickness: 10,
//         child: SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: Scrollbar(
//             thumbVisibility: true,
//             child: SingleChildScrollView(
//               scrollDirection: Axis.vertical,
//               child: DataTable(
//                 columns: const [
//                   DataColumn(label: Text('Descripción')),
//                   DataColumn(label: Text('Marca')),
//                   DataColumn(label: Text('Modelo')),
//                   DataColumn(label: Text('Proyecto')),
//                   DataColumn(label: Text('Fecha de registro')),
//                   DataColumn(label: Text('Estado')),
//                   DataColumn(label: Text('Acciones')),
//                 ],
//                 rows: buildDataRows(),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );

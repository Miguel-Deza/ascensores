import 'package:ascensores/providers/quote_form_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DoorDetailsScreen extends StatefulWidget {
  const DoorDetailsScreen({super.key});

  @override
  State<DoorDetailsScreen> createState() => _DoorDetailsScreenState();
}

class _DoorDetailsScreenState extends State<DoorDetailsScreen> {
  String? selectedOptionCabin;
  String? selectedAccessDoor;
  String? selectedOptionStop1;
  String? selectedOptionStop2;

  List<String> optionsCabin = [
    'Opción 1',
    'Opción 2',
    'Opción 3',
  ];

  List<String> optionsStop1 = [
    'Opción A',
    'Opción B',
    'Opción C',
  ];

  List<String> optionsStop2 = [
    'Opción X',
    'Opción Y',
    'Opción Z',
  ];

  List<String> optionsAccessDoor = [
    'Opción H',
    'Opción J',
    'Opción K',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text(context.watch<QuoteFormProvider>().projectName.toString()),
            // Text(context
            //     .watch<QuoteFormProvider>()
            //     .projectDescription
            //     .toString()),
            // Text(context
            //     .watch<QuoteFormProvider>()
            //     .selectedElevatorBrand
            //     .toString()),
            //
            // Text(context
            //     .watch<QuoteFormProvider>()
            //     .requireDobleAccess
            //     .toString()),
            TextField(
              decoration: InputDecoration(
                labelText: 'Altura de las puertas(mm)',
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                dataRowMaxHeight: double.infinity,
                columns: [
                  DataColumn(label: Text('#')),
                  DataColumn(label: Text('Parada')),
                  DataColumn(label: Text('Ancho (mm)')),
                  DataColumn(label: Text('Puerta A')),
                ],
                rows: [
                  DataRow(
                    cells: [
                      DataCell(SizedBox.shrink()),
                      DataCell(Text('Cabina')),
                      DataCell(Text('200')),
                      DataCell(
                        DropdownButtonFormField<String>(
                          value: selectedOptionCabin,
                          iconEnabledColor: Colors.white,
                          isExpanded: true,
                          items: [
                            for (String option in optionsCabin)
                              DropdownMenuItem(
                                value: option,
                                child: Text(option),
                              ),
                          ],
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedOptionCabin = newValue;
                            });
                          },
                          decoration: const InputDecoration(
                            labelText: 'Seleccione un a opción',
                          ),
                        ),
                      ),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(SizedBox.shrink()),
                      DataCell(Text('Puertas de acceso')),
                      DataCell(SizedBox.shrink()),
                      DataCell(
                        DropdownButtonFormField<String>(
                          value: selectedAccessDoor,
                          iconEnabledColor: Colors.white,
                          isExpanded: true,
                          items: [
                            for (String option in optionsAccessDoor)
                              DropdownMenuItem(
                                value: option,
                                child: Text(option),
                              ),
                          ],
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedAccessDoor = newValue;
                            });
                          },
                          decoration: const InputDecoration(
                            labelText:
                                'Seleccione una opción aplicable a todas las paradas',
                          ),
                        ),
                      ),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('1')),
                      DataCell(Text('Parada 1')),
                      DataCell(Text('200')),
                      DataCell(
                        DropdownButtonFormField<String>(
                          value: selectedOptionStop1,
                          iconEnabledColor: Colors.white,
                          isExpanded: true,
                          items: [
                            for (String option in optionsStop1)
                              DropdownMenuItem(
                                value: option,
                                child: Text(option),
                              ),
                          ],
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedOptionStop1 = newValue;
                            });
                          },
                          decoration: const InputDecoration(
                            labelText: 'Seleccione un a opción',
                          ),
                        ),
                      ),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('2')),
                      DataCell(Text('Parada 2')),
                      DataCell(Text('250')),
                      DataCell(
                        DropdownButtonFormField<String>(
                          value: selectedOptionStop2,
                          iconEnabledColor: Colors.white,
                          isExpanded: true,
                          items: [
                            for (String option in optionsStop2)
                              DropdownMenuItem(
                                value: option,
                                child: Text(option),
                              ),
                          ],
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedOptionStop2 = newValue;
                            });
                          },
                          decoration: const InputDecoration(
                            labelText: 'Seleccione un a opción',
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Agrega más filas según sea necesario
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  print(selectedOptionCabin);
                  print(selectedAccessDoor);
                  print(selectedOptionStop1);
                  print(selectedOptionStop2);
                },
                child: Text('Imprimir datos'))
          ],
        ),
      ),
    ));
  }
}

import 'package:ascensores/providers/quote_form_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ascensores/screens/bottom/cotizations/data/lists_options.dart';

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
            const TextField(
              decoration: InputDecoration(
                labelText: 'Altura de las puertas(mm)',
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                dataRowMaxHeight: double.infinity,
                columns: const [
                  DataColumn(label: Text('#')),
                  DataColumn(label: Text('Parada')),
                  DataColumn(label: Text('Ancho (mm)')),
                  DataColumn(label: Text('Puerta A')),
                ],
                rows: [
                  DataRow(
                    cells: [
                      const DataCell(SizedBox.shrink()),
                      const DataCell(Text('Cabina')),
                      const DataCell(Text('200')),
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
                          onChanged: (newValue) {
                            setState(() {
                              selectedOptionCabin = newValue ?? "";
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
                      const DataCell(SizedBox.shrink()),
                      const DataCell(Text('Puertas de acceso')),
                      const DataCell(SizedBox.shrink()),
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
                          onChanged: (newValue) {
                            setState(() {
                              selectedAccessDoor = newValue ?? "";
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
                      const DataCell(Text('1')),
                      const DataCell(Text('Parada 1')),
                      const DataCell(Text('200')),
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
                          onChanged: (newValue) {
                            setState(() {
                              selectedOptionStop1 = newValue ?? "";
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
                      const DataCell(Text('2')),
                      const DataCell(Text('Parada 2')),
                      const DataCell(Text('250')),
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
                          onChanged: (newValue) {
                            setState(() {
                              selectedOptionStop2 = newValue ?? "";
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
                  final provider = context.read<QuoteFormProvider>();                  
                  provider.selectedOptionCabin = selectedOptionCabin ?? "";
                  provider.selectedAccessDoor = selectedAccessDoor ?? "";
                  provider.selectedOptionStop1 = selectedOptionStop1 ?? "";
                  provider.selectedOptionStop2 = selectedOptionStop2 ?? "";                  
                  provider.printQuoteFormProviderData();
                },
                child: const Text('Imprimir datos'))
          ],
        ),
      ),
    ));
  }
}

import 'package:flutter/material.dart';

class CabinDetailsScreen extends StatefulWidget {
  const CabinDetailsScreen({super.key});

  @override
  State<CabinDetailsScreen> createState() => _CabinDetailsScreenState();
}

class _CabinDetailsScreenState extends State<CabinDetailsScreen> {
  String? selectedCabinType;
  String? selectedCabinRoof;
  String? selectedCabinFloor;
  String? selectedCabinHandrail;

  final TextEditingController doorFrameController = TextEditingController();
  final TextEditingController automaticMarkerController =
      TextEditingController();
  final TextEditingController voiceSynthesizerController =
      TextEditingController();
  final TextEditingController gongController = TextEditingController();
  final TextEditingController firefightersCopController =
      TextEditingController();
  final TextEditingController firefightersLopController =
      TextEditingController();
  final TextEditingController fansController = TextEditingController();
  final TextEditingController seismicSensorController = TextEditingController();
  final TextEditingController transformerController = TextEditingController();
  final TextEditingController extraCableController = TextEditingController();
  final TextEditingController wirelessCardReaderController =
      TextEditingController();
  final TextEditingController wirelessCardsController = TextEditingController();
  final TextEditingController tftCabinController = TextEditingController();
  final TextEditingController tftFloorController = TextEditingController();
  final TextEditingController keyLockSystemController = TextEditingController();
  final TextEditingController lcdCabinController = TextEditingController();
  final TextEditingController lcdFloorController = TextEditingController();

  List<String> cabinTypes = [
    'Option A',
    'Option B',
    'Option C',
  ];

  List<String> cabinRoofs = [
    'Option 1',
    'Option 2',
    'Option 3',
  ];

  List<String> cabinFloors = [
    'Option X',
    'Option Y',
    'Option Z',
  ];

  List<String> cabinHandrails = [
    'Option H',
    'Option J',
    'Option K',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text("Detalles de la cabina"),
          DropdownButtonFormField<String>(
            value: selectedCabinType,
            iconEnabledColor: Colors.white,
            isExpanded: true,
            items: [
              for (String cabinType in cabinTypes)
                DropdownMenuItem(
                  value: cabinType,
                  child: Text(cabinType),
                ),
            ],
            onChanged: (String? newValue) {
              setState(() {
                selectedCabinType = newValue;
              });
            },
            decoration: const InputDecoration(
              labelText: 'Tipo de cabina',
            ),
          ),
          DropdownButtonFormField<String>(
            value: selectedCabinRoof,
            iconEnabledColor: Colors.white,
            isExpanded: true,
            items: [
              for (String cabinRoof in cabinRoofs)
                DropdownMenuItem(
                  value: cabinRoof,
                  child: Text(cabinRoof),
                ),
            ],
            onChanged: (String? newValue) {
              setState(() {
                selectedCabinRoof = newValue;
              });
            },
            decoration: const InputDecoration(
              labelText: 'Techo de cabina',
            ),
          ),
          DropdownButtonFormField<String>(
            value: selectedCabinFloor,
            iconEnabledColor: Colors.white,
            isExpanded: true,
            items: [
              for (String cabinFloor in cabinFloors)
                DropdownMenuItem(
                  value: cabinFloor,
                  child: Text(cabinFloor),
                ),
            ],
            onChanged: (String? newValue) {
              setState(() {
                selectedCabinFloor = newValue;
              });
            },
            decoration: const InputDecoration(
              labelText: 'Tipo de piso de cabina',
            ),
          ),
          DropdownButtonFormField<String>(
            value: selectedCabinHandrail,
            iconEnabledColor: Colors.white,
            isExpanded: true,
            items: [
              for (String cabinHandrail in cabinHandrails)
                DropdownMenuItem(
                  value: cabinHandrail,
                  child: Text(cabinHandrail),
                ),
            ],
            onChanged: (String? newValue) {
              setState(() {
                selectedCabinHandrail = newValue;
              });
            },
            decoration: const InputDecoration(
              labelText: 'Tipo de pasamanos de cabina',
            ),
          ),
          Text("Detalles adicionales"),
          DataTable(
            columns: [
              DataColumn(label: Text('Concepto adicional')),
              DataColumn(label: Text('Precio')),
              DataColumn(label: Text('Cantidad')),
            ],
            rows: [
              DataRow(
                cells: [
                  DataCell(Text('Controlador de Marco de Puerta')),
                  DataCell(Text('\$10.00')),
                  DataCell(
                    // Campo de texto para la cantidad
                    TextFormField(
                      controller: doorFrameController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text('Marcador Automático')),
                  DataCell(Text('\$10.00')),
                  DataCell(
                    // Campo de texto para la cantidad
                    TextFormField(
                      controller: automaticMarkerController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text('Sintetizador de Voz')),
                  DataCell(Text('\$20.00')),
                  DataCell(
                    // Campo de texto para la cantidad
                    TextFormField(
                      controller: voiceSynthesizerController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text('Gong')),
                  DataCell(Text('\$20.00')),
                  DataCell(
                    // Campo de texto para la cantidad
                    TextFormField(
                      controller: gongController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text('Interrupto de Bomberos COP')),
                  DataCell(Text('\$20.00')),
                  DataCell(
                    // Campo de texto para la cantidad
                    TextFormField(
                      controller: firefightersCopController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text('Interrupto de Bomberos LOP')),
                  DataCell(Text('\$20.00')),
                  DataCell(
                    // Campo de texto para la cantidad
                    TextFormField(
                      controller: firefightersLopController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text('Ventilador')),
                  DataCell(Text('\$20.00')),
                  DataCell(
                    // Campo de texto para la cantidad
                    TextFormField(
                      controller: fansController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text('Sensor Sísmico')),
                  DataCell(Text('\$20.00')),
                  DataCell(
                    // Campo de texto para la cantidad
                    TextFormField(
                      controller: seismicSensorController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text('Transformador (\$780)')),
                  DataCell(Text('\$20.00')),
                  DataCell(
                    // Campo de texto para la cantidad
                    TextFormField(
                      controller: transformerController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text('Menos extras de cable (\$780)')),
                  DataCell(Text('\$20.00')),
                  DataCell(
                    // Campo de texto para la cantidad
                    TextFormField(
                      controller: extraCableController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text('Lector de tarjetas inalambricas')),
                  DataCell(Text('\$20.00')),
                  DataCell(
                    // Campo de texto para la cantidad
                    TextFormField(
                      controller: wirelessCardReaderController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text('Tarjetas inalambricas')),
                  DataCell(Text('\$20.00')),
                  DataCell(
                    // Campo de texto para la cantidad
                    TextFormField(
                      controller: wirelessCardsController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text('Display TFT Cabina')),
                  DataCell(Text('\$20.00')),
                  DataCell(
                    // Campo de texto para la cantidad
                    TextFormField(
                      controller: tftCabinController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text('Display TFT Piso')),
                  DataCell(Text('\$20.00')),
                  DataCell(
                    // Campo de texto para la cantidad
                    TextFormField(
                      controller: tftFloorController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text('Sistema de cerradura con llave')),
                  DataCell(Text('\$20.00')),
                  DataCell(
                    // Campo de texto para la cantidad
                    TextFormField(
                      controller: keyLockSystemController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text('Display LCD Cabina')),
                  DataCell(Text('\$20.00')),
                  DataCell(
                    // Campo de texto para la cantidad
                    TextFormField(
                      controller: lcdCabinController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(
                    Text('Display LCD Piso'),
                  ),
                  DataCell(Text('\$20.00')),
                  DataCell(
                    // Campo de texto para la cantidad
                    TextFormField(
                      controller: lcdFloorController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            width: double.infinity,
            child: ElevatedButton(
              child: const Text('Enviar cotización'),
              onPressed: () {
                print('Tipo de cabina seleccionado: $selectedCabinType');
                print('Techo de cabina seleccionado: $selectedCabinRoof');
                print('Piso de cabina seleccionado: $selectedCabinFloor');
                print(
                    'Pasamanos de cabina seleccionado: $selectedCabinHandrail');

                print('Marco de puerta: ${doorFrameController.text}');
                print('Marcador automático: ${automaticMarkerController.text}');
                print(
                    'Sintetizador de voz: ${voiceSynthesizerController.text}');
                print('Gong: ${gongController.text}');
                print('COP de bomberos: ${firefightersCopController.text}');
                print('LOP de bomberos: ${firefightersLopController.text}');
                print('Ventiladores: ${fansController.text}');
                print('Sensor sísmico: ${seismicSensorController.text}');
                print('Transformador: ${transformerController.text}');
                print('Cable extra: ${extraCableController.text}');
                print(
                    'Lector de tarjeta inalámbrico: ${wirelessCardReaderController.text}');
                print('Tarjetas inalámbricas: ${wirelessCardsController.text}');
                print('TFT de cabina: ${tftCabinController.text}');
                print('TFT de piso: ${tftFloorController.text}');
                print(
                    'Sistema de cerradura de llave: ${keyLockSystemController.text}');
                print('LCD de cabina: ${lcdCabinController.text}');
                print('LCD de piso: ${lcdFloorController.text}');
              },
            ),
          ),
        ],
      ),
    );
  }
}

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
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}

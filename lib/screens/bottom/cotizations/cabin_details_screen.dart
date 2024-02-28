import 'package:ascensores/providers/quote_form_provider.dart';
import 'package:flutter/material.dart';
import 'package:ascensores/screens/bottom/cotizations/data/lists_options.dart';
import 'package:provider/provider.dart';

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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Text("Detalles de la cabina"),
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
            onChanged: (newValue) {
              setState(() {
                selectedCabinType = newValue ?? "";
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
            onChanged: (newValue) {
              setState(() {
                selectedCabinRoof = newValue ?? "";
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
            onChanged: (newValue) {
              setState(() {
                selectedCabinFloor = newValue ?? "";
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
            onChanged: (newValue) {
              setState(() {
                selectedCabinHandrail = newValue ?? "";
              });
            },
            decoration: const InputDecoration(
              labelText: 'Tipo de pasamanos de cabina',
            ),
          ),
          const Text("Detalles adicionales"),
          DataTable(
            columns: const [
              DataColumn(label: Text('Concepto adicional')),
              DataColumn(label: Text('Precio')),
              DataColumn(label: Text('Cantidad')),
            ],
            rows: [
              DataRow(
                cells: [
                  const DataCell(Text('Controlador de Marco de Puerta')),
                  const DataCell(Text('\$10.00')),
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
                  const DataCell(Text('Marcador Automático')),
                  const DataCell(Text('\$10.00')),
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
                  const DataCell(Text('Sintetizador de Voz')),
                  const DataCell(Text('\$20.00')),
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
                  const DataCell(Text('Gong')),
                  const DataCell(Text('\$20.00')),
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
                  const DataCell(Text('Interrupto de Bomberos COP')),
                  const DataCell(Text('\$20.00')),
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
                  const DataCell(Text('Interrupto de Bomberos LOP')),
                  const DataCell(Text('\$20.00')),
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
                  const DataCell(Text('Ventilador')),
                  const DataCell(Text('\$20.00')),
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
                  const DataCell(Text('Sensor Sísmico')),
                  const DataCell(Text('\$20.00')),
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
                  const DataCell(Text('Transformador (\$780)')),
                  const DataCell(Text('\$20.00')),
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
                  const DataCell(Text('Menos extras de cable (\$780)')),
                  const DataCell(Text('\$20.00')),
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
                  const DataCell(Text('Lector de tarjetas inalambricas')),
                  const DataCell(Text('\$20.00')),
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
                  const DataCell(Text('Tarjetas inalambricas')),
                  const DataCell(Text('\$20.00')),
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
                  const DataCell(Text('Display TFT Cabina')),
                  const DataCell(Text('\$20.00')),
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
                  const DataCell(Text('Display TFT Piso')),
                  const DataCell(Text('\$20.00')),
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
                  const DataCell(Text('Sistema de cerradura con llave')),
                  const DataCell(Text('\$20.00')),
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
                  const DataCell(Text('Display LCD Cabina')),
                  const DataCell(Text('\$20.00')),
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
                  const DataCell(
                    Text('Display LCD Piso'),
                  ),
                  const DataCell(Text('\$20.00')),
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
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              child: const Text('Enviar cotización'),
              onPressed: () {
                final provider = context.read<QuoteFormProvider>();
                provider.selectedCabinType = selectedCabinType ?? "";
                provider.selectedCabinRoof = selectedCabinRoof ?? "";
                provider.selectedCabinFloor = selectedCabinFloor ?? "";
                provider.selectedCabinHandrail = selectedCabinHandrail ?? "";
                //Detalles adicionales cantidad
                provider.amountDoorFrame = int.parse(doorFrameController.text);
                provider.amountAutomaticMarker =
                    int.parse(automaticMarkerController.text);
                provider.amountVoiceSynthesizer =
                    int.parse(voiceSynthesizerController.text);
                provider.amountGong = int.parse(gongController.text);
                provider.amountFireFightersCop =
                    int.parse(firefightersCopController.text);
                provider.amountFireFightersLop =
                    int.parse(firefightersLopController.text);
                provider.amountFans = int.parse(fansController.text);
                provider.amountSeismicSensor =
                    int.parse(seismicSensorController.text);
                provider.amountTransformer =
                    int.parse(transformerController.text);
                provider.amountExtraCable =
                    int.parse(extraCableController.text);
                provider.amountWirelessCardReader =
                    int.parse(wirelessCardReaderController.text);
                provider.amountWirelessCard =
                    int.parse(wirelessCardsController.text);
                provider.amountTftCabin = int.parse(tftCabinController.text);
                provider.amountTftFloor = int.parse(tftFloorController.text);
                provider.amountKeyLockSystem =
                    int.parse(keyLockSystemController.text);
                provider.amountLcdCabin = int.parse(lcdCabinController.text);
                provider.amountLcdFloor = int.parse(lcdFloorController.text);

                provider.printQuoteFormProviderData();
              },
            ),
          ),
        ],
      ),
    );
  }
}

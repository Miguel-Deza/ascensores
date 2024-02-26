import 'package:ascensores/providers/quote_form_provider.dart';
import 'package:ascensores/screens/bottom/cotizations/data/lists_options.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GeneralDataScreen extends StatefulWidget {
  const GeneralDataScreen({super.key});

  @override
  State<GeneralDataScreen> createState() => _GeneralDataScreenState();
}

class _GeneralDataScreenState extends State<GeneralDataScreen> {
  final TextEditingController projectNameController = TextEditingController();
  final TextEditingController projectDescriptionController =
      TextEditingController();
  String? selectedElevatorBrand;
  String? selectedElevatorModel;
  String? selectedElevatorUse;
  String? selectedElevatorVelocity;
  int? stopsNumber;
  bool? requireDobleAccess;
  String? selectedNumberPanoramicFaces;
  String? selectedDoorWidth;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(60.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('Datos generales '),
              TextField(
                controller: projectNameController,
                decoration: InputDecoration(
                  labelText: 'Proyecto',
                ),
              ),
              TextField(
                controller: projectDescriptionController,
                decoration: InputDecoration(
                  labelText: 'Descripción',
                ),
              ),
              Text('Detalles del Ascensor'),
              DropdownButtonFormField<String>(
                value: selectedElevatorBrand,
                iconEnabledColor: Colors.white,
                isExpanded: true,
                items: [
                  for (String elevatorBrand in elevatorBrands)
                    DropdownMenuItem(
                      value: elevatorBrand,
                      child: Text(elevatorBrand),
                    ),
                ],
                onChanged: (newValue) {
                  setState(() {
                    selectedElevatorBrand = newValue ?? "";
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Marca del ascensor',
                  border: OutlineInputBorder(),
                ),
              ),
              DropdownButtonFormField<String>(
                value: selectedElevatorModel,
                iconEnabledColor: Colors.white,
                isExpanded: true,
                items: [
                  for (String elevatorModel in elevatorModels)
                    DropdownMenuItem(
                      value: elevatorModel,
                      child: Text(elevatorModel),
                    ),
                ],
                onChanged: (newValue) {
                  setState(() {
                    selectedElevatorModel = newValue ?? "";
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Modelo del ascensor',
                  border: OutlineInputBorder(),
                ),
              ),
              DropdownButtonFormField<String>(
                value: selectedElevatorUse,
                iconEnabledColor: Colors.white,
                isExpanded: true,
                items: [
                  for (String elevatorUse in elevatorUses)
                    DropdownMenuItem(
                      value: elevatorUse,
                      child: Text(elevatorUse),
                    ),
                ],
                onChanged: (newValue) {
                  setState(() {
                    selectedElevatorUse = newValue ?? "";
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Uso del ascensor',
                  border: OutlineInputBorder(),
                ),
              ),
              DropdownButtonFormField<String>(
                value: selectedElevatorVelocity,
                iconEnabledColor: Colors.white,
                isExpanded: true,
                items: [
                  for (String elevatorVelocity in elevatorVelocities)
                    DropdownMenuItem(
                      value: elevatorVelocity,
                      child: Text(elevatorVelocity),
                    ),
                ],
                onChanged: (newValue) {
                  setState(() {
                    selectedElevatorVelocity = newValue ?? "";
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Velocidad del ascensor',
                  border: OutlineInputBorder(),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Paradas del ascensor',
                ),
              ),
              Text('Requiere doble acceso'),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  ListTile(
                    title: const Text('Sí'),
                    leading: Radio(
                      value: true,
                      groupValue: requireDobleAccess,
                      onChanged: (value) {
                        setState(() {
                          requireDobleAccess = value!;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('No'),
                    leading: Radio(
                      value: false,
                      groupValue: requireDobleAccess,
                      onChanged: (value) {
                        setState(() {
                          requireDobleAccess = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              DropdownButtonFormField<String>(
                value: selectedNumberPanoramicFaces,
                iconEnabledColor: Colors.white,
                isExpanded: true,
                items: [
                  for (String numberPanoramic in numberPanoramicFaces)
                    DropdownMenuItem(
                      value: numberPanoramic,
                      child: Text(numberPanoramic),
                    ),
                ],
                onChanged: (newValue) {
                  setState(() {
                    selectedNumberPanoramicFaces = newValue ?? "";
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Cantidad de caras panorámicas',
                  border: OutlineInputBorder(),
                ),
              ),
              DropdownButtonFormField<String>(
                value: selectedDoorWidth,
                iconEnabledColor: Colors.white,
                isExpanded: true,
                items: [
                  for (String doorWidth in doorWidths)
                    DropdownMenuItem(
                      value: doorWidth,
                      child: Text(doorWidth),
                    ),
                ],
                onChanged: (newValue) {
                  setState(() {
                    selectedDoorWidth = newValue ?? "";
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Cantidad de anchos de puerta',
                  border: OutlineInputBorder(),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Lógica para guardar los datos
                  print('Nombre del proyecto: ${projectNameController.text}');
                  context.read<QuoteFormProvider>().projectName =
                      projectNameController.text;
                  print(
                      'Descripción del proyecto: ${projectDescriptionController.text}');

                  context.read<QuoteFormProvider>().projectDescription =
                      projectNameController.text;

                  print(
                      'Marca del elevador seleccionada: $selectedElevatorBrand');

                  context.read<QuoteFormProvider>().selectedElevatorBrand =
                      selectedElevatorBrand ?? "";
                  print(
                      'Modelo del elevador seleccionado: $selectedElevatorModel');
                  context.read<QuoteFormProvider>().selectedElevatorModel =
                      selectedElevatorModel ?? "";

                  print('Uso del elevador seleccionado: $selectedElevatorUse');
                  context.read<QuoteFormProvider>().selectedElevatorUse =
                      selectedElevatorUse ?? "";
                  print(
                      'Velocidad del elevador seleccionada: $selectedElevatorVelocity');
                  context.read<QuoteFormProvider>().selectedElevatorVelocity =
                      selectedElevatorVelocity ?? "";
                  print('Número de paradas: ${stopsNumber ?? "Es nulo"}');

                  context.read<QuoteFormProvider>().stopsNumber =
                      stopsNumber ?? 0;
                  ;

                  print('¿Se requiere acceso doble?: $requireDobleAccess');
                  context.read<QuoteFormProvider>().requireDobleAccess =
                      requireDobleAccess ?? false;
                  print(
                      'Número de caras panorámicas seleccionadas: $selectedNumberPanoramicFaces');
                  context
                          .read<QuoteFormProvider>()
                          .selectedNumberPanoramicFaces =
                      selectedNumberPanoramicFaces ?? "";
                  print('Ancho de la puerta seleccionado: $selectedDoorWidth');
                  context.read<QuoteFormProvider>().selectedDoorWidth =
                      selectedDoorWidth ?? "";

                  context
                      .read<QuoteFormProvider>()
                      .printQuoteFormProviderData();
                },
                child: const Text('Guardar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

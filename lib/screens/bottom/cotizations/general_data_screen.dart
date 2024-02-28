import 'package:ascensores/providers/quote_form_provider.dart';
import 'package:ascensores/screens/bottom/cotizations/data/lists_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
              const Text('Datos generales '),
              TextField(
                controller: projectNameController,
                decoration: const InputDecoration(
                  labelText: 'Proyecto',
                ),
              ),
              TextField(
                controller: projectDescriptionController,
                decoration: const InputDecoration(
                  labelText: 'Descripción',
                ),
              ),
              const Text('Detalles del Ascensor'),
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
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onChanged: (value) {
                  stopsNumber = value.isNotEmpty ? int.tryParse(value) : null;
                },
                decoration: const InputDecoration(
                  labelText: 'Paradas del ascensor',
                ),
              ),
              const Text('Requiere doble acceso'),
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
                  final provider = context.read<QuoteFormProvider>();
                  provider.projectName = projectNameController.text;
                  provider.projectDescription =
                      projectDescriptionController.text;
                  provider.selectedElevatorBrand = selectedElevatorBrand ?? "";
                  provider.selectedElevatorModel = selectedElevatorModel ?? "";
                  provider.selectedElevatorUse = selectedElevatorUse ?? "";
                  provider.selectedElevatorVelocity =
                      selectedElevatorVelocity ?? "";
                  provider.stopsNumber = stopsNumber ?? 0;
                  provider.requireDobleAccess = requireDobleAccess ?? false;
                  provider.selectedNumberPanoramicFaces =
                      selectedNumberPanoramicFaces ?? "";
                  provider.selectedDoorWidth = selectedDoorWidth ?? "";
                  
                  provider.printQuoteFormProviderData();
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

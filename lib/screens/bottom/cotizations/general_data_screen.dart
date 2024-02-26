import 'package:flutter/material.dart';

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
  final TextEditingController stopsNumber = TextEditingController();
  bool? requireDobleAccess;
  String? selectedNumberPanoramicFaces;
  String? selectedDoorWidth;

  List<String> elevatorBrands = [
    'Edificio A',
    'Edificio B',
    'Edificio C',
  ];

  List<String> elevatorModels = [
    'Modelo X',
    'Modelo Y',
    'Modelo Z',
  ];

  List<String> elevatorUses = [
    'Residencial',
    'Comercial',
    'Industrial',
  ];

  List<String> elevatorVelocities = [
    '0.5 m/s',
    '1 m/s',
    '1.5 m/s',
    '2 m/s',
    '2.5 m/s',
    '3 m/s',
  ];

  List<String> numberPanoramicFaces = [
    'Ninguna',
    '1',
    '2',
    '3',
    '4',
    '5',
  ];

  List<String> doorWidths = [
    '0.8 m',
    '1 m',
    '1.2 m',
    '1.5 m',
    '1.8 m',
    '2 m',
  ];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(60.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('Datos generales a'),
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
                onChanged: (String? newValue) {
                  setState(() {
                    selectedElevatorBrand = newValue;
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
                onChanged: (String? newValue) {
                  setState(() {
                    selectedElevatorModel = newValue;
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
                onChanged: (String? newValue) {
                  setState(() {
                    selectedElevatorUse = newValue;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Modelo del ascensor',
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
                onChanged: (String? newValue) {
                  setState(() {
                    selectedElevatorVelocity = newValue;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Velocidad del ascensor',
                  border: OutlineInputBorder(),
                ),
              ),
              TextField(
                controller: stopsNumber,
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
                onChanged: (String? newValue) {
                  setState(() {
                    selectedNumberPanoramicFaces = newValue;
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
                onChanged: (String? newValue) {
                  setState(() {
                    selectedDoorWidth = newValue;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Cantidad de caras panorámicas',
                  border: OutlineInputBorder(),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Lógica para guardar los datos
                  print('Nombre del proyecto: ${projectNameController.text}');
                  print(
                      'Descripción del proyecto: ${projectDescriptionController.text}');
                  print(
                      'Marca del elevador seleccionada: $selectedElevatorBrand');
                  print(
                      'Modelo del elevador seleccionado: $selectedElevatorModel');
                  print('Uso del elevador seleccionado: $selectedElevatorUse');
                  print(
                      'Velocidad del elevador seleccionada: $selectedElevatorVelocity');
                  print('Número de paradas: ${stopsNumber.text}');
                  print('¿Se requiere acceso doble?: $requireDobleAccess');
                  print(
                      'Número de caras panorámicas seleccionadas: $selectedNumberPanoramicFaces');
                  print('Ancho de la puerta seleccionado: $selectedDoorWidth');
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

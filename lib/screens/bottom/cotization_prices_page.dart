import 'package:flutter/material.dart';

class CotizationPricesPage extends StatefulWidget {
  const CotizationPricesPage({Key? key}) : super(key: key);

  @override
  State<CotizationPricesPage> createState() => _CotizationPricesPageState();
}

class _CotizationPricesPageState extends State<CotizationPricesPage> {
  String? selectedElevatorBrand;
  String? selectedElevatorModel;
  String? selectedElevatorUse;
  String? selectedElevatorVelocity;
  bool? requireDobleAccess;
  String? selectedNumberPanoramicFaces;

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
    'Ninguna'
        '1',
    '2',
    '3',
    '4',
    '5',
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('Datos generales'),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Proyecto',
                ),
              ),
              TextField(
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
                    selectedElevatorVelocity = newValue;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Cantidad de caras panorámicas',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

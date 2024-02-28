import 'dart:convert';

import 'package:ascensores/providers/duct_form_provider.dart';
import 'package:ascensores/screens/bottom/trafic_study/trafic_study_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class SecondForm extends StatefulWidget {
  const SecondForm({super.key});

  @override
  State<SecondForm> createState() => _SecondFormState();
}

class _SecondFormState extends State<SecondForm> {
  final _formKey = GlobalKey<FormState>();
  String selectedDoorType = "Lateral";

  // Future<void> getTraficStudy() async {
  //   Map<String, dynamic> dataToPass = {
  //     "id": 6,
  //     "stops": 12,
  //     "height": 4,
  //     "surface": 300,
  //     "express_floors": 0,
  //     "units_per_level_served": 12,
  //     "is_hospital": false,
  //     "capacity": 8,
  //     "velocity": 3.0,
  //     "safety_margin": 100,
  //     "door_width": 0.85,
  //     "door_technology": "lateral"
  //   };
  //   const String apiUrl = 'https://dev.ktel.pe/api/traffic-study';
  //   try {
  //     http.Response response = await http.post(Uri.parse(apiUrl),
  //         headers: {
  //           'Authorization':
  //               'Bearer 136|I2nFZZXetgd8oKn1azL02Fw84TUDQdnlZtiqNuhSfc7fcd88',
  //           'Content-Type': 'application/json',
  //         },
  //         body: jsonEncode(dataToPass));

  //     if (response.statusCode == 200) {
  //       print('Bien echo petición: ${response.statusCode}');
  //       Map<String, dynamic> data = jsonDecode(response.body);
  //       print(data);
  //     } else {
  //       print('Error en la petición: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     print('Error en el getDataTable: $e');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<DuctFormProvider>(
      builder: (context, valueProvider, child) => Scaffold(
          body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(60.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Características técnicas',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DropdownButtonFormField<String>(
                    value: valueProvider.selectedPassengerCount,
                    iconEnabledColor: Colors.white,
                    items: [
                      for (String passagerCount
                          in valueProvider.passengerCountDropdownList)
                        DropdownMenuItem(
                          value: passagerCount,
                          child: Text(passagerCount),
                        ),
                    ],
                    onChanged: (String? newValue) {
                      valueProvider.setSelectedPassengerCount(newValue!);
                    },
                    decoration: const InputDecoration(
                      labelText: 'Cantidad de pasajeros',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DropdownButtonFormField<String>(
                    value: valueProvider.selectedElevatorSpeed,
                    iconEnabledColor: Colors.white,
                    items: [
                      for (String elevatorSpeed
                          in valueProvider.elevatorSpeedDropdownList)
                        DropdownMenuItem(
                          value: elevatorSpeed,
                          child: Text(elevatorSpeed),
                        ),
                    ],
                    onChanged: (String? newValue) {
                      valueProvider.setSelectedElevatorSpeed(newValue!);
                    },
                    decoration: const InputDecoration(
                      labelText: 'Velocidad del ascensor',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DropdownButtonFormField<String>(
                    value: valueProvider.selectedDoorWidth,
                    iconEnabledColor: Colors.white,
                    items: [
                      for (String doorWidth
                          in valueProvider.doorWidthDropdownList)
                        DropdownMenuItem(
                          value: doorWidth,
                          child: Text(doorWidth),
                        ),
                    ],
                    onChanged: (value) {
                      valueProvider.setSelectedDoorWidth(value!);
                    },
                    decoration: const InputDecoration(
                      labelText: 'Ancho de la puerta',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Escoge las puertas del ascensor',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Radio<String>(
                            value: 'Lateral',
                            groupValue: selectedDoorType,
                            fillColor: MaterialStateProperty.all(Colors.white),
                            onChanged: (String? value) {
                              setState(() {
                                selectedDoorType = value!;
                              });
                              valueProvider.setSelectedDoorType(value!);
                            },
                          ),
                          const Text('Lateral'),
                        ],
                      ),
                      Row(
                        children: [
                          Radio<String>(
                            value: 'Central',
                            fillColor: MaterialStateProperty.all(Colors.white),
                            groupValue: selectedDoorType,
                            onChanged: (String? value) {
                              setState(() {
                                selectedDoorType = value!;
                              });
                              valueProvider.setSelectedDoorType(value!);
                            },
                          ),
                          const Text('Central'),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: ElevatedButton(
                      onPressed: () async {
                        // Validate returns true if the form is valid, or false otherwise.
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text('Parametros ingresado con éxito!')),
                          );
                          valueProvider.printDataDuctFormProvider();
                          await valueProvider.getDataFromAPI();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TraficStudyPage(),
                            ),
                          );
                        }
                      },
                      child: const Text('Operar'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}

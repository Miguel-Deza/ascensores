import 'dart:convert';

import 'package:ascensores/providers/user_auth_provider.dart';
import 'package:ascensores/screens/create_project_page/results_study_screen.dart';
import 'package:ascensores/screens/trafic_study/results_getted/results_study.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class StudyTraficScreenForm extends StatefulWidget {
  StudyTraficScreenForm({super.key});

  @override
  State<StudyTraficScreenForm> createState() => _StudyTraficScreenFormState();
}

class _StudyTraficScreenFormState extends State<StudyTraficScreenForm> {
  final dynamic keyForm = GlobalKey<FormBuilderState>();

  final List<String> elevatorSpeedDropdownList = [
    "0.4",
    "0.63",
    "1.0",
    "1.6",
    "1.75",
    "2.0",
    "3.0",
  ];

  final List<String> doorWidthDropdownList = [
    "700",
    "750",
    "800",
    "850",
    "900",
    "1000",
    "1100",
    "1200",
    "1300",
    "1400",
    "1500",
  ];

  final List<String> passengerCountDropdownList = [
    "5",
    "6",
    "8",
    "10",
    "13",
    "17",
    "21",
    "50",
  ];

  dynamic getCurrentFormState() {
    if (keyForm.currentState!.saveAndValidate()) {
      // debugPrint(keyForm.currentState!.value.toString());
    } else {
      debugPrint(keyForm.currentState!.value.toString());
      debugPrint("validation failed");
    }
    return keyForm.currentState!.value;
  }

  final testBuildingUseDropdownList = {
    "Oficinas céntricas": "1",
    "Oficinas suburbanas": "2",
    "Oficinas corporativas": "3",
    "Edificio gubernamental": "4",
    "Departamentos alta rentabilidad": "5",
    "Departamentos rentabilidad media": "6",
    "Hospital privado": "7",
    "Hospital estatal": "8",
    "Hotel alta rentabilidad cosmopolita": "9",
    "Hotel alta rentabilidad veraneo": "10",
    "Hotel baja rentabilidad cosmopolita": "11",
    "Hotel baja rentabilidad veraneo": "12",
    "Estacionamiento autoservicio": "13",
    "Estacionamiento tienda departamental": "14",
  };

  Future<bool> storeStudy(var data) async {
    final myUserAuthProvider =
        Provider.of<UserAuthProvider>(context, listen: false);
    String bearerKey = myUserAuthProvider.getTokenUser();
    Map<String, dynamic> dataToPass = {
      "building_type_id": "${data['usoEdificio']}",
      "stops": "${data['numeroParadas']}",
      "height": "${data['alturaEdificio']}",
      "surface": "${data['superficiePlanta']}",
      "express_floors": "${data['pisosExpress']}",
      "units_per_level_served": "${data['numeroUnidadNivelServido']} ",
      //Corrige es hospital
      "is_hospital": false,
      "capacity": "${data['cantidadPasajeros']}",
      "velocity": "${data['velocidadAscensor']}",
      //margen
      "safety_margin": 100,
      "door_width": "${data['anchoPuerta']}",
      "door_technology": "${data['puertasAscensor']}"
    };
    const apiEndpoint = "https://dev.ktel.pe/api/elevator-calculations";
    try {
      http.Response response = await http.post(Uri.parse(apiEndpoint),
          headers: {
            'Authorization': 'Bearer $bearerKey',
            'Content-Type': 'application/json',
          },
          body: jsonEncode(dataToPass));
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        if (mounted) {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ResultsStudyScreen(
                      data: data,
                    )),
          );
        }
        return true;
      } else {
        debugPrint('Error en la petición: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      debugPrint('Error en el getDataFromAPI: $e');
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FormBuilder(
        key: keyForm,
        autovalidateMode: AutovalidateMode.always,
        initialValue: const {
          'usoEdificio': '1', // 'Oficinas céntricas
          'numeroParadas': '12',
          'alturaEdificio': '4',
          'superficiePlanta': '300',
          'pisosExpress': '0',
          'numeroUnidadNivelServido': '12',

          'cantidadPasajeros': '8',
          'velocidadAscensor': '3.0',
          'anchoPuerta': '850',
          'puertasAscensor': 'lateral',
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Text("Estudio", style: TextStyle(fontSize: 25)),
                  FormBuilderDropdown(
                    name: "usoEdificio",
                    decoration: const InputDecoration(
                      labelText: "USO DEL EDIFICIO",
                    ),
                    items: testBuildingUseDropdownList.entries.map((entry) {
                      return DropdownMenuItem(
                        value: entry.value,
                        child: Text(entry.key),
                      );
                    }).toList(),
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: FormBuilderTextField(
                          name: 'numeroParadas',
                          decoration: const InputDecoration(
                            labelText: 'NÚMERO DE PARADAS',
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: FormBuilderTextField(
                          name: 'alturaEdificio',
                          decoration: const InputDecoration(
                            labelText: 'ALTURA DEL EDIFICIO (m)',
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: FormBuilderTextField(
                          name: 'superficiePlanta',
                          decoration: const InputDecoration(
                            labelText: 'SUPERFICIE POR PLANTA (M2)',
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: FormBuilderTextField(
                          name: 'pisosExpress',
                          decoration: const InputDecoration(
                            labelText: 'PISOS EN ZONA EXPRESS',
                          ),
                        ),
                      ),
                    ],
                  ),
                  FormBuilderTextField(
                    name: 'numeroUnidadNivelServido',
                    decoration: const InputDecoration(
                      labelText: 'NÚMERO DE UNIDAD POR NIVEL SERVIDO',
                    ),
                  ),
                  const Text("Características Técnicas",
                      style: TextStyle(fontSize: 25)),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: FormBuilderDropdown(
                          name: "cantidadPasajeros",
                          decoration: const InputDecoration(
                            labelText: "Cantidad de Pasajeros",
                          ),
                          items: passengerCountDropdownList.map((count) {
                            return DropdownMenuItem(
                              value: count,
                              child: Text(count),
                            );
                          }).toList(),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: FormBuilderDropdown(
                          name: "velocidadAscensor",
                          decoration: const InputDecoration(
                            labelText: "Velocidad del Ascensor",
                          ),
                          items: elevatorSpeedDropdownList.map((speed) {
                            return DropdownMenuItem(
                              value: speed,
                              child: Text(speed),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                  FormBuilderDropdown(
                    name: "anchoPuerta",
                    decoration: const InputDecoration(
                      labelText: "Ancho de la Puerta",
                    ),
                    items: doorWidthDropdownList.map((width) {
                      return DropdownMenuItem(
                        value: width,
                        child: Text(width),
                      );
                    }).toList(),
                  ),
                  FormBuilderRadioGroup(
                    name: "puertasAscensor",
                    decoration: const InputDecoration(
                        labelText: "PUERTAS DEL ASCENSOR ESCOGIDAS"),
                    options: const [
                      FormBuilderFieldOption(
                          value: "lateral", child: Text("Lateral")),
                      FormBuilderFieldOption(
                          value: "central", child: Text("Central")),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      var data = getCurrentFormState();
                      await storeStudy(data);
                    },
                    child: const Text("Continuar"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

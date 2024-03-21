import 'dart:convert';
import 'package:ascensores/providers/user_auth_provider.dart';
import 'package:ascensores/screens/trafic_study/results_getted/results_study.dart';
import 'package:ascensores/screens/trafic_study/trafic_study_page/caracteristicas_screen_3.dart';
import 'package:ascensores/screens/trafic_study/trafic_study_page/study_screen_2.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TraficStudyScreen extends StatefulWidget {
  final dimentionsSelectedForm;
  const TraficStudyScreen({super.key, required this.dimentionsSelectedForm});
  @override
  State<TraficStudyScreen> createState() => _TraficStudyScreenState();
}

class _TraficStudyScreenState extends State<TraficStudyScreen> {
  int _index = 0;
  final StudyScreen2 studyScreen2 = StudyScreen2();

  late CaracteristicasTecnicas3 caracteristicasTecnicas3;
  @override
  void initState() {
    super.initState();
    // Inicializa caracteristicasTecnicas3 dentro de initState
    caracteristicasTecnicas3 = CaracteristicasTecnicas3(
        dimentionsSelectedForm: widget.dimentionsSelectedForm);
  }

  List<Step> stepList() => <Step>[
        Step(
          state: _index <= 0 ? StepState.editing : StepState.complete,
          isActive: _index >= 0,
          title: const Text('Estudio'),
          content: studyScreen2,
          // DetailsElevator1(),
        ),
        Step(
          state: _index <= 1 ? StepState.editing : StepState.complete,
          isActive: _index >= 1,
          title: const Text('Características'),
          content: caracteristicasTecnicas3,
        ),
      ];
  //APIS
  Future<bool> storeStudy() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
    var currentStateForm2 = studyScreen2.getCurrentFormState().value;
    var currentStateForm3 =
        caracteristicasTecnicas3.getCurrentFormState().value;
    final myUserAuthProvider =
        Provider.of<UserAuthProvider>(context, listen: false);
    String bearerKey = myUserAuthProvider.getTokenUser();
    Map<String, dynamic> dataToPass = {
      "building_type_id": "${currentStateForm2['usoEdificio']}",
      "stops": "${currentStateForm2['numeroParadas']}",
      "height": "${currentStateForm2['alturaEdificio']}",
      "surface": "${currentStateForm2['superficiePlanta']}",
      "express_floors": "${currentStateForm2['pisosExpress']}",
      "units_per_level_served":
          "${currentStateForm2['numeroUnidadNivelServido']}",
      //Corrige es hospital
      "is_hospital": false,
      "capacity": "${currentStateForm3['cantidadPasajeros']}",
      "velocity": "${currentStateForm3['velocidadAscensor']}",
      //margen
      "safety_margin": 100,
      "door_width": "${currentStateForm3['anchoPuerta']}",
      "door_technology": "${currentStateForm3['puertasAscensor']}"
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
                builder: (context) => ResultsStudy(
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
    print("Impresión desde trafic_study_screen");
    print(widget.dimentionsSelectedForm);
    return Scaffold(
      body: SafeArea(
        child: Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme.copyWith(
                  primary: Colors.orange[900],
                ),
          ),
          child: Stepper(
            type: StepperType.horizontal,
            currentStep: _index,
            onStepCancel: () {
              if (_index > 0) {
                setState(() {
                  _index -= 1;
                });
              }
            },
            onStepContinue: () async {
              final isLastStep = _index == stepList().length - 1;
              if (isLastStep) {
                debugPrint("Enviado");
                await storeStudy();
                // await quoteCreate();
              } else {
                setState(() {
                  _index += 1;
                });
              }
            },
            onStepTapped: (int index) {
              setState(() {
                _index = index;
              });
            },
            steps: stepList(),
          ),
        ),
      ),
    );
  }
}

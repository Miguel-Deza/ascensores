import 'dart:convert';

import 'package:ascensores/screens/quotes_screen/details_cabin_3.dart';
import 'package:ascensores/screens/quotes_screen/details_door_2.dart';
import 'package:ascensores/screens/quotes_screen/details_elevator_1.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class QuotesScreen extends StatefulWidget {
  const QuotesScreen({super.key});

  @override
  State<QuotesScreen> createState() => _QuotesScreenState();
}

class _QuotesScreenState extends State<QuotesScreen> {
  int _index = 0;
  final DetailsElevator1 detailsElevator1 = DetailsElevator1();
  final DetailsDoor2 detailsDoor2 = DetailsDoor2();
  final DetailsCabin3 detailsCabin3 = DetailsCabin3();

  Future<void> quoteCreate() async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });
    String apiUrl = 'https://dev.ktel.pe/api/quotes';
    String accessToken = '239|ca0aRbNaRpXwkZgup9k4AhibzNSwGacJUlDOGs1h1cf9209b';

    var currentStateForm1 = detailsElevator1.getCurrentFormState().value;
    var currentStateForm2 = detailsDoor2.getCurrentFormState().value;
    var currentStateForm3 = detailsCabin3.getCurrentFormState().value;
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Authorization': 'Bearer $accessToken',
          'Content-Type': 'application/json'
        },
        body: jsonEncode({
          "project": "${currentStateForm1['nombreProyecto']}",
          "description": "${currentStateForm1['descripcionProyecto']}",
          "brand": "${currentStateForm1['marcaAscensor']}",
          //De donde saca el modelo?
          "model": "1",
          "usage": "${currentStateForm1['usoAscensor']}",
          "velocity": "${currentStateForm1['velocidadAscensor']}",
          "stops": "${currentStateForm1['paradasAscensor']}",
          "double_access": "${currentStateForm1['requiereDobleAcceso']}",
          "panoramic_faces": "${currentStateForm1['cantidadCarasPanoramicas']}",
          "door_width": "${currentStateForm1['anchoPuertas']}",
          //Segundo formulario\
          //Aca uso 2000 en lugar de 2
          "height": "${currentStateForm2['alturaPuertas']}",
          //De donde saco el tipo de cabina
          "cabin_material": "${currentStateForm2['cabina']}",
          // //Tercer Formulario
          "cabin_type": "${currentStateForm3['tipoCabina']}",
          "cabin_floor": "${currentStateForm3['pisoCabina']}",
          "cabin_ceiling": "${currentStateForm3['techoCabina']}",
          "cabin_handrail": "${currentStateForm3['pasamanosCabina']}",
          "cabin_dimensions": "${currentStateForm3['pasamanosCabina']}",
          "shipments": "${currentStateForm3['dimensionesInternas']}",
          // //Numero de objetos
          "door_frame_controller":
              "${currentStateForm3['controladorMarcoPuerta'].toInt()}",
          "automatic_marker":
              "${currentStateForm3['marcadorAutomatico'].toInt()}",
          "voice_synthesizer":
              "${currentStateForm3['sintetizadorVoz'].toInt()}",
          "gong": "${currentStateForm3['gong'].toInt()}",
          "firefighters_cop":
              "${currentStateForm3['interruptorBomberosCOP'].toInt()}",
          "firefighters_lop":
              "${currentStateForm3['interruptorBomberosLOP'].toInt()}",
          "fans": "${currentStateForm3['ventilador'].toInt()}",
          "seismic_sensor": "${currentStateForm3['sensorSismico'].toInt()}",
          "transformer": "${currentStateForm3['transformador'].toInt()}",
          "extra_cable": "${currentStateForm3['metrosExtrasCable'].toInt()}",
          "wireless_card_reader":
              "${currentStateForm3['lectorTarjetasInalambricas'].toInt()}",
          "wireless_cards":
              "${currentStateForm3['tarjetasInalambricas'].toInt()}",
          "tft_cabin": "${currentStateForm3['DisplayTFTCabina'].toInt()}",
          "tft_floor": "${currentStateForm3['DisplayTFTPiso'].toInt()}",
          "key_lock_system":
              "${currentStateForm3['sistemaCerraduraConLlave'].toInt()}",
          "lcd_cabin": "${currentStateForm3['displayLCDCabina'].toInt()}",
          "lcd_floor": "${currentStateForm3['displayLCDPiso'].toInt()}"
        }),
      );

      if (response.statusCode == 201) {
        print('Solicitud POST exitosa');
        print('Respuesta: ${response.body}');
      } else {
        print(
            'Error en la solicitud POST. Código de estado: ${response.statusCode}');
        print('Mensaje de error: ${response.body}');
      }
    } catch (e) {
      print('Error al realizar la solicitud POST: $e');
    }
    Navigator.pop(context);
    Alert(
      context: context,
      type: AlertType.success,
      title: "Cotización realizada",
      desc:
          "Cotización realizada con éxito. Nos pondremos en contacto con usted a la brevedad posible.",
      buttons: [
        DialogButton(
          child: Text(
            "Aceptar",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
          color: Colors.orange[900],
        )
      ],
      
    ).show();
  }

  List<Step> stepList() => <Step>[
        Step(
          state: _index <= 0 ? StepState.editing : StepState.complete,
          isActive: _index >= 0,
          title: const Text('Step 1 title'),
          content: detailsElevator1,
          // DetailsElevator1(),
        ),
        Step(
          state: _index <= 1 ? StepState.editing : StepState.complete,
          isActive: _index >= 1,
          title: const Text('Step 2 title'),
          content: detailsDoor2,
        ),
        Step(
          state: StepState.editing,
          isActive: _index >= 2,
          title: const Text('Step 2 title'),
          content: detailsCabin3,
        ),
      ];

  @override
  Widget build(BuildContext context) {
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
                print('Completed');
                await quoteCreate();
                
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

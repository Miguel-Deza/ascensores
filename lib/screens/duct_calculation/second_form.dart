import 'package:ascensores/providers/duct_form_provider.dart';
import 'package:ascensores/providers/user_auth_provider.dart';
import 'package:ascensores/screens/trafic_study/trafic_study_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SecondForm extends StatefulWidget {
  const SecondForm({super.key});

  @override
  State<SecondForm> createState() => _SecondFormState();
}

class _SecondFormState extends State<SecondForm> {
  final _formKey = GlobalKey<FormState>();
  String selectedDoorType = "Lateral";

  @override
  Widget build(BuildContext context) {
    return Consumer<DuctFormProvider>(
      builder: (context, valueProvider, child) => Scaffold(
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/fondo.jpg"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.1), BlendMode.dstATop),
              ),
            ),
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(60.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Características técnicas',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
                        labelText: 'Velocidad del ascensor (m/s)',
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
                        labelText: 'Ancho de la puerta (mm)',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Escoge las puertas del ascensor',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Radio<String>(
                              value: 'Lateral',
                              groupValue: selectedDoorType,
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
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('Parametros ingresado con éxito!')),
                            );
                            final myUserAuthProvider =
                                Provider.of<UserAuthProvider>(context,
                                    listen: false);
                            String myToken = myUserAuthProvider.getTokenUser();

                            await valueProvider.getDataFromAPI(myToken);
                            Navigator.pop(
                              context,
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const TraficStudyPage(),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      'Uno de los datos son incorrectos o faltantes!')),
                            );
                          }
                        },
                        child: const Text('Enviar'),
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}

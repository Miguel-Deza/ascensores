import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

const List<int> list = <int>[375, 450, 630, 800, 1000];

class ElevatorSizingScreen extends StatefulWidget {
  const ElevatorSizingScreen({super.key});

  @override
  State<ElevatorSizingScreen> createState() => _ElevatorSizingScreenState();
}

class _ElevatorSizingScreenState extends State<ElevatorSizingScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dimensionamiento del ascensor'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FormBuilder(
              key: _formKey,
              child: Column(
                children: [
                  FormBuilderTextField(
                    name: 'text',
                  ),
                  FormBuilderDropdown(
                    name: 'ratedLoad',
                    decoration: const InputDecoration(
                      labelText: 'Carga Nominal (kg)',
                    ),
                    items: list
                        .map((size) => DropdownMenuItem(
                              value: size.toString(),
                              child: Text(size.toString() + ' kg'),
                            ))
                        .toList(),
                  ),
                  FormBuilderRadioGroup(
                    name: 'doorType',
                    initialValue: '2C',
                    decoration: const InputDecoration(
                      labelText: 'Tipo de Puerta',
                    ),
                    options: [
                      FormBuilderFieldOption(
                        value: '2C',
                        child: Text('2C'),
                      ),
                      FormBuilderFieldOption(
                        value: '2T',
                        child: Text('2T'),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Validate and save the form values
                      _formKey.currentState?.saveAndValidate();
                      debugPrint(_formKey.currentState?.value.toString());
                    },
                    child: const Text('Login'),
                  ),
                ],
              ),
            ),
            Center(
              child: Container(
                width: 300,
                height: 380,
                color: Colors.blue,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RotatedBox(
                      quarterTurns: 3,
                      child: Text("Fondo del ducto: 1550",
                          style: TextStyle(fontSize: 20, color: Colors.white)),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("Ancho del ducto: 1550",
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
                        Container(
                          width: 220,
                          height: 250,
                          color: Colors.red,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: 50,
                                  height: 100,
                                  color: Colors.purple,
                                ),
                                Container(
                                  width: 20,
                                  height: 50,
                                  color: Colors.purple,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      width: 100,
                                      height: 200,
                                      color: Colors.brown,
                                      child: Row(
                                        children: [
                                          RotatedBox(
                                            quarterTurns: 3,
                                            child: Text("1350",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white)),
                                          ),
                                          Column(
                                            children: [
                                              Text("1350",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.white))
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 100,
                                      height: 5,
                                      color: Colors.green,
                                    ),
                                    Container(
                                      width: 100,
                                      height: 5,
                                      color: Colors.orange,
                                    ),
                                  ],
                                ),
                                Container(
                                  width: 20,
                                  height: 50,
                                  color: Colors.purple,
                                ),
                              ],
                            ),
                          ),
                        ), // Separación entre los dos cuadrados
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

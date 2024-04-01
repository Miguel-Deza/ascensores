import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class DuctDesignScreen extends StatefulWidget {
  const DuctDesignScreen({super.key});

  @override
  State<DuctDesignScreen> createState() => _DuctDesignScreenState();
}

class _DuctDesignScreenState extends State<DuctDesignScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  TextEditingController _anchoDuctoController = TextEditingController();
  TextEditingController _fondoDuctoController = TextEditingController();
  TextEditingController _anchoCabinaController = TextEditingController();
  TextEditingController _fondoCabinaController = TextEditingController();
  bool prioridadDucto = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shadowColor: Colors.blue[900],
          elevation: 5.0,
          backgroundColor: Colors.blue[900],
          centerTitle: true,
          title: const Text(
            'DISEÑO DE DUCTOS',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: FormBuilder(
            key: _formKey,
            initialValue: {
              'prioridad': 'DUCTO',
              'tipoPuerta': 'L2',
            },
            child: Padding(
              padding: EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FormBuilderRadioGroup(
                    name: 'prioridad',
                    options: ['DUCTO', 'CABINA']
                        .map((e) => FormBuilderFieldOption(value: e))
                        .toList(),
                    decoration: const InputDecoration(
                      label: Text("Seleccione los datos a proporcionar"),
                    ),
                    onChanged: (value) {
                      if (value == "DUCTO") {
                        setState(() {
                          prioridadDucto = true;
                        });
                      } else {
                        setState(() {
                          prioridadDucto = false;
                        });
                      }
                    },
                  ),
                  Visibility(
                    visible: prioridadDucto,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 15.0),
                          child: Text(
                            "DUCTO",
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.w400),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: FormBuilderTextField(
                                name: "anchoDucto",
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                keyboardType: TextInputType.number,
                                controller: _anchoDuctoController,
                                onChanged: (value) {
                                  if (prioridadDucto) {
                                    _anchoCabinaController.text =
                                        (double.parse(value!) - 550).toString();
                                  } else {
                                    _anchoCabinaController.text = "0";
                                  }
                                },
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  label: Text("ANCHO"),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: FormBuilderTextField(
                                name: "fondoDucto",
                                keyboardType: TextInputType.number,
                                controller: _fondoDuctoController,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    label: Text("FONDO")),
                                onChanged: (value) {
                                  if (prioridadDucto) {
                                    _fondoCabinaController.text =
                                        (double.parse(value!) - 350).toString();
                                  } else {
                                    _fondoCabinaController.text = "0";
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: !prioridadDucto,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Text(
                            "CABINA",
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.w400),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: FormBuilderTextField(
                                name: "anchoCabina",
                                controller: _anchoCabinaController,
                                onChanged: (value) {
                                  if (value!.isNotEmpty) {
                                    _anchoDuctoController.text =
                                        (double.parse(value) + 550).toString();
                                  } else {
                                    _anchoDuctoController.text = "0";
                                  }
                                },
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    label: Text("ANCHO")),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: FormBuilderTextField(
                                name: "fondoCabina",
                                controller: _fondoCabinaController,
                                onChanged: (value) {
                                  if (value!.isNotEmpty) {
                                    _fondoDuctoController.text =
                                        (double.parse(value) + 350).toString();
                                  } else {
                                    _fondoDuctoController.text = "0";
                                  }
                                },
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    label: Text("FONDO")),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Text(
                      "PUERTA",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w400),
                    ),
                  ),
                  FormBuilderRadioGroup(
                    name: 'tipoPuerta',
                    options: ['L2', 'C2']
                        .map((e) => FormBuilderFieldOption(value: e))
                        .toList(),
                    decoration: InputDecoration(
                      label: Text("TIPO"),
                    ),
                  ),
                  FormBuilderTextField(
                    name: "anchoPuerta",
                    decoration:
                        const InputDecoration(labelText: 'ANCHO PUERTA'),
                  ),
                  Visibility(
                    visible: prioridadDucto,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Text(
                            "CABINA",
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.w400),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: FormBuilderTextField(
                                name: "anchoCabina",
                                controller: _anchoCabinaController,
                                enabled: false,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  label: Text("ANCHO"),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: FormBuilderTextField(
                                name: "fondoCabina",
                                controller: _fondoCabinaController,
                                enabled: false,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    label: Text("FONDO")),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: !prioridadDucto,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 15.0),
                          child: Text(
                            "DUCTO",
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.w400),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: FormBuilderTextField(
                                name: "anchoDucto",
                                enabled: false,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                keyboardType: TextInputType.number,
                                controller: _anchoDuctoController,
                                onChanged: (value) {
                                  if (value!.isNotEmpty) {
                                    _anchoCabinaController.text =
                                        (double.parse(value) - 550).toString();
                                  } else {
                                    _anchoCabinaController.text = "0";
                                  }
                                },
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    label: Text("ANCHO")),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: FormBuilderTextField(
                                enabled: false,
                                name: "fondoDucto",
                                controller: _fondoDuctoController,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    label: Text("FONDO")),
                                onChanged: (value) {
                                  if (value!.isNotEmpty) {
                                    _fondoCabinaController.text =
                                        (double.parse(value) - 350).toString();
                                  } else {
                                    _fondoCabinaController.text = "0";
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.saveAndValidate()) {
                          _formKey.currentState?.patchValue({
                            'age': '50',
                            'slider': 6.7,
                            'filter_chip': ['Test 1'],
                            'choice_chip': 'Test 2',
                            'rate': 4,
                          });
                          print(_formKey.currentState!.value);
                        }

                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => DuctDesignScreen(),
                        //   ),
                        // );
                      },
                      child: const Text('Continuar'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

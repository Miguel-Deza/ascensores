import 'package:ascensores/screens/create_project_page/duct_plane_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class DuctDesignScreen extends StatefulWidget {
  const DuctDesignScreen({super.key});

  @override
  State<DuctDesignScreen> createState() => _DuctDesignScreenState();
}

class _DuctDesignScreenState extends State<DuctDesignScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  final TextEditingController _anchoDuctoController = TextEditingController();
  final TextEditingController _fondoDuctoController = TextEditingController();
  final TextEditingController _anchoCabinaController = TextEditingController();
  final TextEditingController _fondoCabinaController = TextEditingController();
  bool prioridadDucto = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shadowColor: Colors.blue[900],
          elevation: 5.0,
          backgroundColor: Colors.blue[900],
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text(
            'Diseño de ductos',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: FormBuilder(
            key: _formKey,
            initialValue: const {
              'prioridad': 'Ducto',
              'tipoPuerta': 'L2',
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FormBuilderRadioGroup(
                        name: 'prioridad',
                        options: ['Ducto', 'Cabina']
                            .map((e) => FormBuilderFieldOption(value: e))
                            .toList(),
                        decoration: const InputDecoration(
                          label: Text("Seleccione los datos a proporcionar"),
                        ),
                        onChanged: (value) {
                          if (value == "Ducto") {
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
                                "Ducto",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: FormBuilderTextField(
                                    name: "anchoDucto",
                                    keyboardType: TextInputType.number,
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(),
                                      FormBuilderValidators.numeric(),
                                    ]),
                                    controller: _anchoDuctoController,
                                    onChanged: (value) {
                                      if (value!.isNotEmpty) {
                                        if (prioridadDucto) {
                                          _anchoCabinaController.text =
                                              (double.parse(value!) - 550)
                                                  .toString();
                                        } else {
                                          _anchoCabinaController.text = "0";
                                        }
                                      } else {
                                        _anchoCabinaController.text = "0";
                                      }
                                    },
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      label: Text("Ancho"),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: FormBuilderTextField(
                                    name: "fondoDucto",
                                    keyboardType: TextInputType.number,
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(),
                                      FormBuilderValidators.numeric(),
                                    ]),
                                    controller: _fondoDuctoController,
                                    decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        label: Text("Fondo")),
                                    onChanged: (value) {
                                      if (value!.isNotEmpty) {
                                        if (prioridadDucto) {
                                          _fondoCabinaController.text =
                                              (double.parse(value!) - 350)
                                                  .toString();
                                        } else {
                                          _fondoCabinaController.text = "0";
                                        }
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
                            const Padding(
                              padding: EdgeInsets.only(top: 15.0),
                              child: Text(
                                "Cabina",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: FormBuilderTextField(
                                    name: "anchoCabina",
                                    controller: _anchoCabinaController,
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) {
                                      if (value!.isNotEmpty) {
                                        _anchoDuctoController.text =
                                            (double.parse(value) + 550)
                                                .toString();
                                      } else {
                                        _anchoDuctoController.text = "0";
                                      }
                                    },
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(),
                                      FormBuilderValidators.numeric(),
                                    ]),
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      label: Text("Ancho"),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: FormBuilderTextField(
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(),
                                      FormBuilderValidators.numeric(),
                                    ]),
                                    keyboardType: TextInputType.number,
                                    name: "fondoCabina",
                                    controller: _fondoCabinaController,
                                    onChanged: (value) {
                                      if (value!.isNotEmpty) {
                                        _fondoDuctoController.text =
                                            (double.parse(value) + 350)
                                                .toString();
                                      } else {
                                        _fondoDuctoController.text = "0";
                                      }
                                    },
                                    decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        label: Text("Fondo")),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 15.0),
                        child: Text(
                          "Puerta",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w400),
                        ),
                      ),
                      FormBuilderRadioGroup(
                        name: 'tipoPuerta',
                        options: ['L2', 'C2']
                            .map((e) => FormBuilderFieldOption(value: e))
                            .toList(),
                        decoration: const InputDecoration(
                          label: Text("Tipo"),
                        ),
                      ),
                      FormBuilderTextField(
                        name: "anchoPuerta",
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            labelText: 'Ancho de la puerta'),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.numeric(),
                        ]),
                      ),
                      Visibility(
                        visible: prioridadDucto,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 15.0),
                              child: Text(
                                "Cabina",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w400),
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
                                      label: Text("Ancho"),
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
                                        label: Text("Fondo")),
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
                                "Ducto",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w400),
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
                                            (double.parse(value) - 550)
                                                .toString();
                                      } else {
                                        _anchoCabinaController.text = "0";
                                      }
                                    },
                                    decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        label: Text("Ancho")),
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
                                        label: Text("Fondo")),
                                    onChanged: (value) {
                                      if (value!.isNotEmpty) {
                                        _fondoCabinaController.text =
                                            (double.parse(value) - 350)
                                                .toString();
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
                              print(_formKey.currentState!.value);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DuctPlaneScreen(
                                      dataForm: _formKey.currentState!.value),
                                ),
                              );
                            }
                          },
                          child: const Text('Continuar'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}

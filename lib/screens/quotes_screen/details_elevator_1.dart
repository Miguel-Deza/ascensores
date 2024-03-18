import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class DetailsElevator1 extends StatelessWidget {
  DetailsElevator1({super.key});
  final dynamic keyForm = GlobalKey<FormBuilderState>();

  dynamic getCurrentFormState() {
    if (keyForm.currentState!.saveAndValidate()) {
      print(keyForm.currentState!.value);
    } else {
      print(keyForm.currentState!.value);
      print("validation failed");
    }
    return keyForm.currentState;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FormBuilder(
        key: keyForm,
        autovalidateMode: AutovalidateMode.always,
        initialValue: const {
          'nombreProyecto': 'Proyecto de prueba #',
          'descripcionProyecto': 'Cotización del proyecto número #',
          'requiereDobleAcceso': '0',
          'marcaAscensor': 'Kleemann',
          'velocidadAscensor': '1',
          'modeloAscensor': 'ATLAS BASIC SP 630',
          'usoAscensor': 'residential',
          'paradasAscensor': 5,
          'anchoPuertas': '800',
          'cantidadCarasPanoramicas': '0',
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const Text("Datos Generales", style: TextStyle(fontSize: 25)),
                FormBuilderTextField(
                    name: 'nombreProyecto',
                    decoration: const InputDecoration(
                      labelText: 'PROYECTO',
                    )),
                FormBuilderTextField(
                  name: 'descripcionProyecto',
                  decoration: const InputDecoration(
                    labelText: 'DESCRIPCIÓN',
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    "Detalles del Ascensor",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: FormBuilderDropdown(
                          name: "marcaAscensor",
                          decoration: const InputDecoration(
                              labelText: "MARCA DEL ASCENSOR"),
                          items: const [
                            DropdownMenuItem(
                                value: "Kleemann", child: Text("Kleemann")),
                            DropdownMenuItem(
                                value: "Doppler", child: Text("Doppler")),
                            DropdownMenuItem(
                                value: "Ares Lift", child: Text("Ares Lift")),
                          ]),
                    ),
                    Expanded(
                      child: FormBuilderDropdown(
                          decoration: const InputDecoration(
                              labelText: "MODELO DEL ASCENSOR"),
                          name: "modeloAscensor",
                          items: const [
                            DropdownMenuItem(
                                value: "ATLAS BASIC SP 630",
                                child: Text("ATLAS BASIC SP 630")),
                            DropdownMenuItem(
                                value: "MAISON T PLUS SP 400",
                                child: Text("MAISON T PLUS SP 400")),
                            DropdownMenuItem(
                                value: "ATLAS BASIC SP 800",
                                child: Text("ATLAS BASIC SP 800")),
                            DropdownMenuItem(
                                value: "ATLAS BASIC SP 1000",
                                child: Text("ATLAS BASIC SP 1000")),
                            DropdownMenuItem(
                                value: "ATLAS RL 630",
                                child: Text("ATLAS RL 630")),
                            DropdownMenuItem(
                                value: "ATLAS BASIC SP 450",
                                child: Text("ATLAS BASIC SP 450")),
                            DropdownMenuItem(
                                value: "ATLAS GIGAS SP 1275",
                                child: Text("ATLAS GIGAS SP 1275")),
                            DropdownMenuItem(
                                value: "ATLAS RL 1000",
                                child: Text("ATLAS RL 1000")),
                            DropdownMenuItem(
                                value: "ATLAS GIGAS SP 1600",
                                child: Text("ATLAS GIGAS SP 1600")),
                            DropdownMenuItem(
                                value: "ATLAS GIGAS SP 2000",
                                child: Text("ATLAS GIGAS SP 2000")),
                            DropdownMenuItem(
                                value: "ATLAS GIGAS SP 1800",
                                child: Text("ATLAS GIGAS SP 1800")),
                            DropdownMenuItem(
                                value: "ATLAS GIGAS SP 2500",
                                child: Text("ATLAS GIGAS SP 2500")),
                            DropdownMenuItem(
                                value: "ATLAS BASIC SP 900",
                                child: Text("ATLAS BASIC SP 900")),
                            DropdownMenuItem(
                                value: "ATLAS GIGAS SP 1350",
                                child: Text("ATLAS GIGAS SP 1350")),
                            DropdownMenuItem(
                                value: "ATLAS GIGAS SP 1425",
                                child: Text("ATLAS GIGAS SP 1425")),
                          ]),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: FormBuilderDropdown(
                          decoration: const InputDecoration(
                              labelText: "USO DEL ASCENSOR"),
                          name: "usoAscensor",
                          items: const [
                            DropdownMenuItem(
                                value: "residential",
                                child: Text("Residencial")),
                            DropdownMenuItem(
                                value: "commercial", child: Text("Comercial")),
                          ]),
                    ),
                    Expanded(
                      child: FormBuilderDropdown(
                          decoration: const InputDecoration(
                              labelText: "VELOCIDAD DEL ASCENSOR"),
                          name: "velocidadAscensor",
                          items: const [
                            DropdownMenuItem(value: "1", child: Text("1 m/s")),
                            DropdownMenuItem(
                                value: "1.6", child: Text("1.6 m/s")),
                          ]),
                    ),
                  ],
                ),
                FormBuilderSlider(
                  name: 'paradasAscensor',
                  initialValue: 5,
                  min: 2,
                  max: 16,
                  divisions: 14,
                  decoration: const InputDecoration(
                    labelText: 'PARADAS DEL ASCENSOR',
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: FormBuilderDropdown(
                          name: "anchoPuertas",
                          decoration: const InputDecoration(
                              labelText: "ANCHO DE PUERTAS"),
                          items: const [
                            DropdownMenuItem(
                                value: "800", child: Text("800 mm")),
                            DropdownMenuItem(
                                value: "850", child: Text("850 mm")),
                            DropdownMenuItem(
                                value: "900", child: Text("900 mm")),
                            DropdownMenuItem(
                                value: "1000", child: Text("1000 mm")),
                          ]),
                    ),
                    Expanded(
                      child: FormBuilderDropdown(
                          name: "cantidadCarasPanoramicas",
                          decoration: const InputDecoration(
                              labelText: "CARAS PANORAMICAS"),
                          items: const [
                            DropdownMenuItem(
                                value: "0", child: Text("Ninguna")),
                            DropdownMenuItem(value: "1", child: Text("1 cara")),
                            DropdownMenuItem(value: "2", child: Text("2 cara")),
                            DropdownMenuItem(value: "3", child: Text("3 cara")),
                          ]),
                    ),
                  ],
                ),
                FormBuilderRadioGroup(
                  name: "requiereDobleAcceso",
                  decoration: const InputDecoration(
                      labelText: "¿REQUIERE DOBLE ACCESO?"),
                  options: const [
                    FormBuilderFieldOption(value: "1", child: Text("Si")),
                    FormBuilderFieldOption(value: "0", child: Text("No")),
                  ],
                ),
                // SizedBox(
                //   width: double.infinity,
                //   child: ElevatedButton(
                //     onPressed: () {
                //       if (keyForm.currentState!.saveAndValidate()) {
                //         print(keyForm.currentState!.value);
                //       } else {
                //         print(keyForm.currentState!.value);
                //         print("validation failed");
                //       }
                //     },
                //     child: const Text('Continuar'),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

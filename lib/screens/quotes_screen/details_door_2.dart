import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class DetailsDoor2 extends StatelessWidget {
  DetailsDoor2({super.key});
  final int numeroParadas = 5;
  final keyForm = GlobalKey<FormBuilderState>();

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
        initialValue: const {
          'alturaPuertas': '2000',
          'cabina': '1',
          'puertaAcceso': '1',
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const Text(
                  "Detalles de las puertas",
                  style: TextStyle(fontSize: 25),
                ),
                FormBuilderTextField(
                  name: 'alturaPuertas',
                  decoration: const InputDecoration(
                    labelText: 'ALTURA DE LAS PUERTAS (MM)',
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: FormBuilderDropdown(
                        name: "cabina",
                        decoration: const InputDecoration(
                          label: Text("Cabina - Ancho #900mm"),
                        ),
                        items: const [
                          DropdownMenuItem(
                            value: "1",
                            child: Text("Acero Inox"),
                          ),
                          DropdownMenuItem(
                            value: "2",
                            child: Text("Pintura Epóxica"),
                          ),
                          DropdownMenuItem(
                            value: "3",
                            child: Text("Full Glass"),
                          ),
                          DropdownMenuItem(
                            value: "4",
                            child: Text("Big Vision"),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: FormBuilderDropdown(
                          name: "puertaAcceso",
                          decoration: const InputDecoration(
                            label: Text("P. Acceso - Ancho #900mm"),
                          ),
                          items: const [
                            DropdownMenuItem(
                              value: "1",
                              child: Text("Acero Inox"),
                            ),
                            DropdownMenuItem(
                              value: "2",
                              child: Text("Pintura Epóxica"),
                            ),
                            DropdownMenuItem(
                              value: "3",
                              child: Text("Full Glass"),
                            ),
                            DropdownMenuItem(
                              value: "4",
                              child: Text("Big Vision"),
                            ),
                          ]),
                    ),
                  ],
                ),
                const Text(
                  "Paradas",
                  style: TextStyle(fontSize: 25),
                ),
                for (int i = 0; i < numeroParadas; i++)
                  FormBuilderDropdown(
                    name: 'parada${i + 1}',
                    initialValue: "Acero Inox",
                    decoration: InputDecoration(
                      label: Text("Parada ${i + 1} Ancho #900mm"),
                    ),
                    items: const [
                      DropdownMenuItem(
                        value: "Acero Inox",
                        child: Text("Acero Inox"),
                      ),
                      DropdownMenuItem(
                        value: "Pintura Epóxica",
                        child: Text("Pintura Epóxica"),
                      ),
                      DropdownMenuItem(
                        value: "Full Glass",
                        child: Text("Full Glass"),
                      ),
                      DropdownMenuItem(
                        value: "Big Vision",
                        child: Text("Big Vision"),
                      ),
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

/////////////////////////////////////////////////


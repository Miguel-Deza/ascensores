import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CaracteristicasTecnicas3 extends StatelessWidget {
  
  CaracteristicasTecnicas3({super.key});
  final dynamic keyForm = GlobalKey<FormBuilderState>();

  dynamic getCurrentFormState() {
    if (keyForm.currentState!.saveAndValidate()) {
      debugPrint(keyForm.currentState!.value.toString());
    } else {
      debugPrint(keyForm.currentState!.value.toString());
      debugPrint("validation failed");
    }
    return keyForm.currentState;
  }

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

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: keyForm,
      autovalidateMode: AutovalidateMode.always,
      initialValue: const {
        'cantidadPasajeros': '8',
        'velocidadAscensor': '3.0',
        'anchoPuerta': '850',
        'puertasAscensor': 'lateral',
      },
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Text("Características Técnicas",
                  style: TextStyle(fontSize: 25)),
              FormBuilderDropdown(
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
              FormBuilderDropdown(
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
            ],
          ),
        ),
      ),
    );
  }
}

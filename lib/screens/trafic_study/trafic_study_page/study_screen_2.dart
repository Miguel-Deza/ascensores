import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class StudyScreen2 extends StatelessWidget {
  StudyScreen2({super.key});
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

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: keyForm,
      autovalidateMode: AutovalidateMode.always,
      initialValue: const {
        'usoEdificio': '1', // 'Oficinas céntricas
        'numeroParadas': '12',
        'alturaEdificio': '4',
        'superficiePlanta': '300',
        'pisosExpress': '0',
        'numeroUnidadNivelServido': '12',
      },
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
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
              FormBuilderTextField(
                name: 'numeroParadas',
                decoration: const InputDecoration(
                  labelText: 'NÚMERO DE PARADAS',
                ),
              ),
              FormBuilderTextField(
                name: 'alturaEdificio',
                decoration: const InputDecoration(
                  labelText: 'ALTURA DEL EDIFICIO (m)',
                ),
              ),
              FormBuilderTextField(
                name: 'superficiePlanta',
                decoration: const InputDecoration(
                  labelText: 'SUPERFICIE POR PLANTA (M2)',
                ),
              ),
              FormBuilderTextField(
                name: 'pisosExpress',
                decoration: const InputDecoration(
                  labelText: 'PISOS EN ZONA EXPRESS',
                ),
              ),
              FormBuilderTextField(
                name: 'numeroUnidadNivelServido',
                decoration: const InputDecoration(
                  labelText: 'NÚMERO DE UNIDAD POR NIVEL SERVIDO',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

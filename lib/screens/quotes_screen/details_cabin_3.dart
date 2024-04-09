import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';

class DetailsCabin3 extends StatelessWidget {
  DetailsCabin3({super.key});
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

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: keyForm,
      initialValue: const {
        'tipoCabina': '1',
        'pisoCabina': '1',
        'techoCabina': '1',
        'pasamanosCabina': '1',
        'dimensionesInternas': 'Anchura x Altura x Profundidad',
        'embarques': '1',
      },
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Text(
                "Detalles de las cabina",
                style: TextStyle(fontSize: 25),
              ),
              FormBuilderDropdown(
                name: "tipoCabina",
                decoration: const InputDecoration(
                  label: Text("Tipo de cabina"),
                ),
                items: const [
                  DropdownMenuItem(
                    value: "1",
                    child: Text("A510 SP"),
                  ),
                  DropdownMenuItem(
                    value: "2",
                    child: Text("A520 SP"),
                  ),
                  DropdownMenuItem(
                    value: "3",
                    child: Text("A530 SP"),
                  ),
                  DropdownMenuItem(
                    value: "4",
                    child: Text("A710 SP"),
                  ),
                  DropdownMenuItem(
                    value: "5",
                    child: Text("L310 SP"),
                  ),
                  DropdownMenuItem(
                    value: "6",
                    child: Text("L320 SP"),
                  ),
                  DropdownMenuItem(
                    value: "7",
                    child: Text("L510 SP"),
                  ),
                  DropdownMenuItem(
                    value: "8",
                    child: Text("L530 SP"),
                  ),
                  DropdownMenuItem(
                    value: "9",
                    child: Text("L710 SP"),
                  ),
                  DropdownMenuItem(
                    value: "10",
                    child: Text("L320 SP PINTADO"),
                  ),
                  DropdownMenuItem(
                    value: "11",
                    child: Text("T110 SP"),
                  ),
                  DropdownMenuItem(
                    value: "12",
                    child: Text("T120 SP"),
                  ),
                  DropdownMenuItem(
                    value: "13",
                    child: Text("T310 SP"),
                  ),
                  DropdownMenuItem(
                    value: "14",
                    child: Text("T710 SP"),
                  ),
                ],
              ),
              FormBuilderDropdown(
                name: "pisoCabina",
                decoration: const InputDecoration(
                  label: Text("Piso de cabina"),
                ),
                items: const [
                  DropdownMenuItem(
                    value: "1",
                    child: Text("Granito Artificial"),
                  ),
                  DropdownMenuItem(
                    value: "2",
                    child: Text("Azulejos de cerámica"),
                  ),
                  DropdownMenuItem(
                    value: "3",
                    child: Text("Piso laminado"),
                  ),
                  DropdownMenuItem(
                    value: "4",
                    child: Text("Piso de goma"),
                  ),
                  DropdownMenuItem(
                    value: "5",
                    child: Text("Preparado para arquitectura"),
                  ),
                ],
              ),
              FormBuilderDropdown(
                name: "techoCabina",
                decoration: const InputDecoration(
                  label: Text("Techo de cabina"),
                ),
                items: const [
                  DropdownMenuItem(
                    value: "1",
                    child: Text("03"),
                  ),
                  DropdownMenuItem(
                    value: "2",
                    child: Text("07"),
                  ),
                  DropdownMenuItem(
                    value: "3",
                    child: Text("010"),
                  ),
                  DropdownMenuItem(
                    value: "4",
                    child: Text("013"),
                  ),
                  DropdownMenuItem(
                    value: "5",
                    child: Text("014"),
                  ),
                  DropdownMenuItem(
                    value: "6",
                    child: Text("015"),
                  ),
                  DropdownMenuItem(
                    value: "7",
                    child: Text("055"),
                  ),
                  DropdownMenuItem(
                    value: "8",
                    child: Text("FC1"),
                  ),
                  DropdownMenuItem(
                    value: "9",
                    child: Text("FC5"),
                  ),
                  DropdownMenuItem(
                    value: "10",
                    child: Text("FC6"),
                  ),
                  DropdownMenuItem(
                    value: "11",
                    child: Text("FC11"),
                  ),
                  DropdownMenuItem(
                    value: "12",
                    child: Text("T120"),
                  ),
                ],
              ),
              FormBuilderDropdown(
                name: "pasamanosCabina",
                decoration: const InputDecoration(
                  label: Text("Pasamanos de cabina"),
                ),
                items: const [
                  DropdownMenuItem(
                    value: "1",
                    child: Text("K2"),
                  ),
                  DropdownMenuItem(
                    value: "2",
                    child: Text("K7"),
                  ),
                ],
              ),
              FormBuilderTextField(
                name: "dimensionesInternas",
                decoration: const InputDecoration(
                  labelText: 'Dimensiones internas (ancho X alto X profundo)',
                ),
              ),
              FormBuilderTextField(
                name: "embarques",
                decoration: const InputDecoration(
                  labelText: 'Embarques',
                ),
              ),
              const Text(
                "Detalles adicionales",
                style: TextStyle(fontSize: 25),
              ),
              FormBuilderTouchSpin(
                name: "controladorMarcoPuerta",
                decoration: const InputDecoration(
                  labelText: 'Controlador de marco de puerta',
                ),
                initialValue: 1,
                max: 100,
                min: 1,
                enabled: false,
              ),
              FormBuilderTouchSpin(
                name: "marcadorAutomatico",
                decoration: const InputDecoration(
                  labelText: 'Marcador automático',
                ),
                initialValue: 1,
                max: 100,
                min: 1,
                enabled: false,
              ),
              FormBuilderTouchSpin(
                name: "sintetizadorVoz",
                decoration: const InputDecoration(
                  labelText: 'Sintetizador de voz',
                ),
                initialValue: 1,
                max: 100,
                min: 1,
                enabled: false,
              ),
              FormBuilderTouchSpin(
                name: "gong",
                decoration: const InputDecoration(
                  labelText: 'Gong',
                ),
                initialValue: 1,
                max: 100,
                min: 1,
                enabled: false,
              ),
              FormBuilderTouchSpin(
                name: "interruptorBomberosCOP",
                decoration: const InputDecoration(
                  labelText: 'Interruptor de bomberos COP',
                ),
                initialValue: 1,
                max: 100,
                min: 1,
                enabled: false,
              ),
              FormBuilderTouchSpin(
                name: "interruptorBomberosLOP",
                decoration: const InputDecoration(
                  labelText: 'Interruptor de bomberos LOP',
                ),
                initialValue: 1,
                max: 100,
                min: 1,
                enabled: false,
              ),
              FormBuilderTouchSpin(
                name: "ventilador",
                decoration: const InputDecoration(
                  labelText: 'Ventilador',
                ),
                initialValue: 1,
                max: 100,
                min: 1,
              ),
              FormBuilderTouchSpin(
                name: "sensorSismico",
                decoration: const InputDecoration(
                  labelText: 'Sensor sísmico',
                ),
                initialValue: 1,
                max: 100,
                min: 1,
                enabled: false,
              ),
              FormBuilderTouchSpin(
                name: "transformador",
                decoration: const InputDecoration(
                  labelText: 'Transformador (\$780)',
                ),
                initialValue: 1,
                max: 100,
                min: 1,
                enabled: false,
              ),
              FormBuilderTouchSpin(
                name: "metrosExtrasCable",
                decoration: const InputDecoration(
                  labelText: 'Metros extras de cable',
                ),
                initialValue: 1,
                max: 100,
                min: 1,
              ),
              FormBuilderTouchSpin(
                name: "lectorTarjetasInalambricas",
                decoration: const InputDecoration(
                  labelText: 'Lector de tarjetas inalambricas',
                ),
                initialValue: 1,
                max: 100,
                min: 1,
                enabled: false,
              ),
              FormBuilderTouchSpin(
                name: "tarjetasInalambricas",
                decoration: const InputDecoration(
                  labelText: 'Tarjetas inalambricas',
                ),
                initialValue: 1,
                max: 100,
                min: 1,
              ),
              FormBuilderTouchSpin(
                name: "DisplayTFTCabina",
                decoration: const InputDecoration(
                  labelText: 'Display TFT cabina',
                ),
                initialValue: 1,
                max: 100,
                min: 1,
                enabled: false,
              ),
              FormBuilderTouchSpin(
                name: "DisplayTFTPiso",
                decoration: const InputDecoration(
                  labelText: 'Display TFT piso',
                ),
                initialValue: 1,
                max: 100,
                min: 1,
              ),
              FormBuilderTouchSpin(
                name: "sistemaCerraduraConLlave",
                decoration: const InputDecoration(
                  labelText: 'Sistema de cerradura con llave',
                ),
                initialValue: 1,
                max: 100,
                min: 1,
              ),
              FormBuilderTouchSpin(
                name: "displayLCDCabina",
                decoration: const InputDecoration(
                  labelText: 'Display LCD cabina',
                ),
                initialValue: 1,
                max: 100,
                min: 1,
                enabled: false,
              ),
              FormBuilderTouchSpin(
                name: "displayLCDPiso",
                decoration: const InputDecoration(
                  labelText: 'Display LCD piso',
                ),
                initialValue: 1,
                max: 100,
                min: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}



/////////////////////////////////////////////////


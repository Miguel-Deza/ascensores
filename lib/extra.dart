import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class InputSelectDimentions extends StatefulWidget {
  const InputSelectDimentions({super.key});

  @override
  State<InputSelectDimentions> createState() => _InputSelectDimentionsState();
}

class _InputSelectDimentionsState extends State<InputSelectDimentions> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  TextEditingController textController = TextEditingController();
  String? _selectedValue;
  List<int>? _dropdownValues;

  Map<String, List<int>> aperturaCentral = {
    "1600": [600, 650, 700],
    "1700": [600, 650, 700],
    "1750": [600, 650, 700, 750, 800],
    "1800": [600, 650, 700, 750, 800],
    "1850": [600, 650, 700, 750, 800],
    "1900": [600, 650, 700, 750, 800],
    "2000": [650, 700, 750, 800, 900],
    "2150": [700, 750, 800, 900, 1000],
    "2200": [700, 750, 800, 900, 1000]
  };

  Map<String, List<int>> aperturaLateral = {
    "1500": [650, 700, 750, 800],
    "1550": [650, 700, 750, 800],
    "1600": [650, 700, 750, 800, 850],
    "1700": [700, 750, 800, 850, 900],
    "1750": [700, 750, 800, 850, 900],
    "1800": [700, 750, 800, 850, 900],
    "1850": [700, 750, 800, 850, 900, 1000],
    "1900": [750, 800, 850, 900, 1000],
    "2000": [800, 850, 900, 1000, 1100],
    "2150": [850, 900, 1000, 1100, 1200],
    "2200": [850, 900, 1000, 1100, 1200]
  };

  double _getValorMasCercano(double anchoIngresado) {
    // Lista de valores
    List<double> valores = [1600, 1700, 1800, 1850, 1900, 2000, 2150, 2200];

    // Variable para almacenar el valor más cercano
    double valorMasCercano = valores[0];
    // Variable para almacenar la menor diferencia absoluta
    double menorDiferencia = (valores[0] - anchoIngresado).abs();

    for (double valor in valores) {
      // Calcular la diferencia absoluta actual
      double diferenciaActual = (valor - anchoIngresado).abs();

      // Actualizar el valor más cercano y la menor diferencia si es necesario
      if (diferenciaActual < menorDiferencia) {
        valorMasCercano = valor;
        menorDiferencia = diferenciaActual;
      }
    }

    // Retornar el valor más cercano
    return valorMasCercano;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter FormBuilder Example'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: FormBuilder(
            initialValue: {
              "tipoPuerta": "central",
              "anchoDucto": "1600",
            },
            key: _formKey,
            child: Column(
              children: <Widget>[
                FormBuilderRadioGroup(
                  name: "tipoPuerta",
                  decoration: const InputDecoration(
                      labelText: "SELECCIONE UN TIPO DE PUERTA"),
                  options: const [
                    FormBuilderFieldOption(
                        value: "central", child: Text("Central (C2)")),
                    FormBuilderFieldOption(
                        value: "lateral", child: Text("Lateral (L2)")),
                  ],
                ),
                TextField(
                  controller: textController,
                  decoration: InputDecoration(
                    labelText: 'ANCHO DEL DUCTO (mm)',
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // set value programmatically
                    if (_formKey.currentState!.saveAndValidate()) {
                      print(_formKey.currentState!.value);
                    }
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     SnackBar(
                    //       content: Text('Form is valid!'),
                    //       backgroundColor: Colors.green,
                    //     ),
                    //   );
                    // } else {
                    //   print('Form is invalid!');
                    // }
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

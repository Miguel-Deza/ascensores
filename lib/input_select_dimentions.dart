import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class InputSelectDimentions extends StatefulWidget {
  const InputSelectDimentions({super.key});

  @override
  State<InputSelectDimentions> createState() => _InputSelectDimentionsState();
}

class _InputSelectDimentionsState extends State<InputSelectDimentions> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  var isCentral = true;

  List<int>? _dropdownValues;
  final TextEditingController _controllerAnchoDucto = TextEditingController();
  final TextEditingController _controllerAnchoPuerta = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controllerAnchoDucto.addListener(_updateDropdownValues);
  }

  void _updateDropdownValues() {
    final enteredValue = _controllerAnchoDucto.text;
    isCentral = _formKey.currentState!.fields['tipoPuerta']!.value == 'central';
    print(isCentral);
    if (isCentral) {
      setState(() {
        _dropdownValues = aperturaCentral[enteredValue];
        if (_dropdownValues != null) {
          _controllerAnchoPuerta.text = _dropdownValues![0].toString();
        }
      });
    } else {
      setState(() {
        _dropdownValues = aperturaLateral[enteredValue];
        if (_dropdownValues != null) {
          _controllerAnchoPuerta.text = _dropdownValues![0].toString();
        }
      });
    }
  }

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

  int _getValorMasCercano(double anchoIngresado) {
    List<double> valores;
    if (isCentral) {
      valores = [1600, 1700, 1800, 1850, 1900, 2000, 2150, 2200];
    } else {
      valores = [
        1500,
        1550,
        1600,
        1700,
        1750,
        1800,
        1850,
        1900,
        2000,
        2150,
        2200,
      ];
    }
    int valorMasCercano = valores[0].toInt();
    double menorDiferencia = (valores[0] - anchoIngresado).abs();

    for (double valor in valores) {
      // Si el valor actual es menor y más cercano, lo asignamos como el valor más cercano
      if (valor < anchoIngresado &&
          (anchoIngresado - valor) < menorDiferencia) {
        valorMasCercano = valor.toInt();
        menorDiferencia = anchoIngresado - valor;
      }
    }

    return valorMasCercano;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selección de Medidas'),
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
                  onChanged: (value) {
                    print(value);
                  },
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
                  controller: _controllerAnchoDucto,
                  decoration: InputDecoration(
                    labelText: 'ANCHO DEL DUCTO (mm)',
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    _updateDropdownValues();
                  },
                  onEditingComplete: () {
                    double valorIngresado =
                        double.tryParse(_controllerAnchoDucto.text) ?? 1600.0;
                    _controllerAnchoDucto.text =
                        _getValorMasCercano(valorIngresado).toString();
                    FocusManager.instance.primaryFocus?.unfocus();
                    print(_controllerAnchoDucto.text);
                  },
                  onTapOutside: (event) {
                    double valorIngresado =
                        double.tryParse(_controllerAnchoDucto.text) ?? 1600.0;
                    _controllerAnchoDucto.text =
                        _getValorMasCercano(valorIngresado).toString();
                    FocusManager.instance.primaryFocus?.unfocus();
                    print(_controllerAnchoDucto.text);
                  },
                ),
                Text(
                  'ANCHO DE LA PUERTA',
                ),
                DropdownButton<String>(
                  value: _controllerAnchoPuerta.text,
                  onChanged: (newValue) {
                    setState(() {
                      _controllerAnchoPuerta.text = newValue ?? '';
                    });
                    print(_controllerAnchoPuerta.text);
                  },
                  items: _dropdownValues?.map((value) {
                        return DropdownMenuItem<String>(
                          value: value.toString(),
                          child: Text(value.toString()),
                        );
                      }).toList() ??
                      [],
                ),
                Text(
                  'CONFIGURACIÓN DE LA CABINA',
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

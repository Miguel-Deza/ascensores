import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Formulario Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyForm(),
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  String _cargaNominal = '';
  List<String> _tipoPuertaOptions = [];
  String _selectedTipoPuerta = '';
  String _numeroPersonas = '';
  String _dimensionesCabina = '';
  String _pasoLibre = '';
  String _ducto = '';
  final Map<String, Map<String, dynamic>> _formData = {
    '375': {
      'numeroPersonas': '5',
      'cabina': '900x1200',
      'tipoPuertaOptions': ['C2', 'T2'],
      'puertasData': {
        'C2': {'pasoLibre': '700', 'ducto': '1600x1500'},
        'T2': {'pasoLibre': '800', 'ducto': '1550x1580'}
      }
    },
    '450': {
      'numeroPersonas': '6',
      'cabina': '1000x1250',
      'tipoPuertaOptions': ['T2'],
      'puertasData': {
        'T2': {'pasoLibre': '800', 'ducto': '1600x1630'}
      }
    },
    '630': {
      'numeroPersonas': '8',
      'cabina': '1100x1400',
      'tipoPuertaOptions': ['C2', 'T2'],
      'puertasData': {
        'C2': {'pasoLibre': '700', 'ducto': '1700x1780'},
        'T2': {'pasoLibre': '800', 'ducto': '1700x1780'}
      }
    },
    '800': {
      'numeroPersonas': '10',
      'cabina': '1350x1400',
      'tipoPuertaOptions': ['T2'],
      'puertasData': {
        'T2': {'pasoLibre': '900', 'ducto': '1950x1780'}
      }
    },
    '1000': {
      'numeroPersonas': '13',
      'cabina': 'Multiple',
      'cabinaData': [
        {
          'dimensiones': '1100x2100',
          'tipoPuerta': 'T2',
          'pasoLibreOptions': ['900', '1000'],
          'ducto': {'900': '1650x2480', '1000': '1850x2480'}
        },
        {
          'dimensiones': '2100x1100',
          'tipoPuerta': 'C2',
          'pasoLibreOptions': ['1000', '1200'],
          'ducto': {'1000': '2700x1400', '1200': '2700x1400'}
        },
        {
          'dimensiones': '1400x1600',
          'tipoPuerta': 'T2',
          'pasoLibre': '1000',
          'ducto': '2000x1950'
        }
      ]
    }
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario Flutter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: FormBuilder(
            key: _formKey,
            child: Column(
              children: [
                FormBuilderDropdown(
                  name: 'cargaNominal',
                  decoration: InputDecoration(labelText: 'Carga Nominal'),
                  items: _formData.keys
                      .map((cargaNominal) => DropdownMenuItem(
                            value: cargaNominal,
                            child: Text(cargaNominal),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _cargaNominal = value.toString();
                      _tipoPuertaOptions =
                          _formData[_cargaNominal]?['tipoPuertaOptions'];
                      _selectedTipoPuerta = '';
                      _numeroPersonas =
                          _formData[_cargaNominal]?['numeroPersonas'];
                      _dimensionesCabina = _formData[_cargaNominal]?['cabina'];
                      _pasoLibre = '';
                      _ducto = '';
                    });
                  },
                ),
                SizedBox(height: 10),
                if (_tipoPuertaOptions.isNotEmpty)
                  FormBuilderDropdown(
                    name: 'tipoPuerta',
                    decoration: InputDecoration(labelText: 'Tipo de Puerta'),
                    items: _tipoPuertaOptions
                        .map((tipoPuerta) => DropdownMenuItem(
                              value: tipoPuerta,
                              child: Text(tipoPuerta),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedTipoPuerta = value.toString();
                        final puertasData =
                            _formData[_cargaNominal]?['puertasData'];
                        _pasoLibre =
                            puertasData[_selectedTipoPuerta]['pasoLibre'];
                        _ducto = puertasData[_selectedTipoPuerta]['ducto'];
                      });
                    },
                  ),
                SizedBox(height: 10),
                if (_cargaNominal.isNotEmpty && _selectedTipoPuerta.isNotEmpty)
                  ..._buildFormFields(),
                SizedBox(height: 10),
                if (_cargaNominal.isNotEmpty && _selectedTipoPuerta.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Número de Personas: $_numeroPersonas'),
                      Text('Medida de la Cabina: $_dimensionesCabina'),
                      Text('Paso Libre: $_pasoLibre'),
                      Text('Ducto: $_ducto'),
                    ],
                  ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.saveAndValidate()) {
                      final formData = _formKey.currentState!.value;
                      print(formData);
                    }
                  },
                  child: Text('Guardar'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildFormFields() {
    final List<Widget> formFields = [];
    if (_cargaNominal != '1000') {
      final Map<String, dynamic> puertasData =
          _formData[_cargaNominal]?['puertasData'][_selectedTipoPuerta];
      puertasData.forEach((key, value) {
        formFields.add(FormBuilderTextField(
          name: key,
          decoration: InputDecoration(labelText: key),
          initialValue: value.toString(),
          readOnly: true,
        ));
      });
    } else {
      final List<Map<String, dynamic>> cabinasData =
          _formData[_cargaNominal]?['cabinaData'];
      cabinasData.forEach((cabina) {
        formFields.add(FormBuilderTextField(
          name: 'dimensiones_${cabina['dimensiones']}',
          decoration: InputDecoration(
              labelText: 'Dimensiones: ${cabina['dimensiones']}'),
          initialValue: cabina['dimensiones'],
          readOnly: true,
        ));
        if (cabina['tipoPuerta'] == _selectedTipoPuerta) {
          String? selectedPasoLibreValue;
          if (cabina.containsKey('pasoLibre')) {
            formFields.add(FormBuilderDropdown(
              name: 'pasoLibre_${cabina['dimensiones']}',
              decoration: InputDecoration(labelText: 'Paso libre'),
              initialValue: selectedPasoLibreValue,
              items: cabina['pasoLibreOptions']
                  .map((pasoLibre) => DropdownMenuItem(
                        value: pasoLibre,
                        child: Text(pasoLibre),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedPasoLibreValue = value.toString();
                });
              },
            ));
          }
          formFields.add(FormBuilderTextField(
            name: 'ducto_${cabina['dimensiones']}',
            decoration: InputDecoration(labelText: 'Ducto'),
            initialValue: cabina['ducto'].toString(),
            readOnly: true,
          ));
        }
      });
    }
    return formFields;
  }
}

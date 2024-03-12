import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:ascensores/screens/form_data.dart';

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

  String fondoDucto = "";
  String anchoDucto = "";
  String fondoCabina = "";
  String anchoCabina = "";

  Map<String, Map<String, dynamic>> _formData = formData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dimencionamiento del Ascensor'),
        centerTitle: true,
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
                // if (_cargaNominal.isNotEmpty && _selectedTipoPuerta.isNotEmpty)
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Text('Número de Personas: $_numeroPersonas'),
                //     Text('Medida de la Cabina: $_dimensionesCabina'),
                //     Text('Paso Libre: $_pasoLibre'),
                //     Text('Ducto: $_ducto'),
                //   ],
                // ),
                SizedBox(height: 10),
                Center(
                  child: Container(
                    width: 300,
                    height: 380,
                    color: Colors.blue,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RotatedBox(
                          quarterTurns: 3,
                          child: Text(
                              "F.D: ${_ducto != "" ? _ducto.split('x')[1] : ""}",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("A.D: ${_ducto.split('x')[0]}",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white)),
                            Container(
                              width: 220,
                              height: 250,
                              color: Colors.red,
                              child: Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 100,
                                      color: Colors.purple,
                                    ),
                                    Container(
                                      width: 20,
                                      height: 50,
                                      color: Colors.purple,
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          width: 100,
                                          height: 200,
                                          color: Colors.brown,
                                          child: Row(
                                            children: [
                                              RotatedBox(
                                                quarterTurns: 3,
                                                child: Text(
                                                    "F.C: ${_dimensionesCabina != "" ? _dimensionesCabina.split('x')[1] : ""}",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.white)),
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "${_dimensionesCabina.split('x')[0]}",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.white),
                                                  ),
                                                  Text("P.L:${_pasoLibre}",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors.white))
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 100,
                                          height: 5,
                                          color: Colors.green,
                                        ),
                                        Container(
                                          width: 100,
                                          height: 5,
                                          color: Colors.orange,
                                        ),
                                      ],
                                    ),
                                    Container(
                                      width: 20,
                                      height: 50,
                                      color: Colors.purple,
                                    ),
                                  ],
                                ),
                              ),
                            ), // Separación entre los dos cuadrados
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                if (_cargaNominal.isNotEmpty && _selectedTipoPuerta.isNotEmpty)
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.saveAndValidate()) {
                          Map<String, dynamic> formData =
                              Map.from(_formKey.currentState!.value);
                          formData['pasoLibre'] = _pasoLibre;
                          formData['ducto'] = _ducto;
                          formData['numeroPersonas'] = _numeroPersonas;
                          formData['cabina'] = _dimensionesCabina;

                          setState(() {
                            if (_selectedTipoPuerta != "") {
                              fondoDucto = formData['ducto'].split('x')[0];
                              anchoDucto = formData['ducto'].split('x')[1];
                              fondoCabina = _dimensionesCabina.split('x')[0];
                              anchoCabina = _dimensionesCabina.split('x')[1];
                            }
                            print(formData);
                          });
                        }
                      },
                      child: Text('Guardar'),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

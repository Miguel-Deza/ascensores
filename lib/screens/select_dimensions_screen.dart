import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:ascensores/screens/form_data.dart';
import 'package:ascensores/screens/graphic.dart';

class SelectDimensionsScreen extends StatefulWidget {
  const SelectDimensionsScreen({super.key});
  @override
  State<SelectDimensionsScreen> createState() => _SelectDimensionsScreenState();
}

class _SelectDimensionsScreenState extends State<SelectDimensionsScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  List<String> _tipoPuertaOptions = ["C2", "T2"];
  List<String> pasosLibresIn1000Case = [];

  //* Core datos
  String _cargaNominal = '375';
  String _numeroPersonas = '5';
  String _dimensionesCabina = '900x1200';
  String _selectedTipoPuerta = 'C2';
  String _pasoLibre = '700';
  String _dimensionesDucto = '1600x1500';

  //* Extra datos
  String fondoDucto = "1500";
  String anchoDucto = "1600";
  String fondoCabina = "1200";
  String anchoCabina = "900";

  Map<String, Map<String, dynamic>> _formData = formData;

  @override
  Widget build(BuildContext context) {
    List<String> cabinasKeys = _formData["1000"]?["cabinas"].keys.toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dimencionamiento del Ascensor',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(26.0),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: FormBuilderDropdown(
                      name: 'cargaNominal',
                      decoration: InputDecoration(labelText: 'Carga nominal'),
                      initialValue: _cargaNominal,
                      items: _formData.keys
                          .map(
                            (cargaNominal) => DropdownMenuItem(
                              value: cargaNominal,
                              child: Text(cargaNominal),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _cargaNominal = value.toString();
                        });
                        if (_cargaNominal != "1000") {
                          _tipoPuertaOptions =
                              _formData[_cargaNominal]?['tipoPuertaOptions'];
                          if (_tipoPuertaOptions.length == 1) {
                            if (_cargaNominal == "450") {
                              setState(() {
                                _selectedTipoPuerta = _tipoPuertaOptions[0];
                                _numeroPersonas = "6";
                                _dimensionesCabina =
                                    _formData[_cargaNominal]?['cabina'];
                                _pasoLibre = _formData[_cargaNominal]
                                        ?['puertasData'][_selectedTipoPuerta]
                                    ['pasoLibre'];
                                _dimensionesDucto = _formData[_cargaNominal]
                                        ?['puertasData'][_selectedTipoPuerta]
                                    ['ducto'];
                              });
                            }
                            if (_cargaNominal == "800") {
                              setState(() {
                                _selectedTipoPuerta = _tipoPuertaOptions[0];
                                _numeroPersonas = "10";
                                _dimensionesCabina =
                                    _formData[_cargaNominal]?['cabina'];
                                _pasoLibre = _formData[_cargaNominal]
                                        ?['puertasData'][_selectedTipoPuerta]
                                    ['pasoLibre'];
                                _dimensionesDucto = _formData[_cargaNominal]
                                        ?['puertasData'][_selectedTipoPuerta]
                                    ['ducto'];
                              });
                            }
                          } else {
                            if (_cargaNominal == "375") {
                              setState(() {
                                _numeroPersonas = "5";
                                _dimensionesCabina =
                                    _formData[_cargaNominal]?['cabina'];
                                _pasoLibre = _formData[_cargaNominal]
                                        ?['puertasData'][_selectedTipoPuerta]
                                    ['pasoLibre'];
                                _dimensionesDucto = _formData[_cargaNominal]
                                        ?['puertasData'][_selectedTipoPuerta]
                                    ['ducto'];
                              });
                            }
                            if (_cargaNominal == "630") {
                              setState(() {
                                _numeroPersonas = "8";
                                _dimensionesCabina =
                                    _formData[_cargaNominal]?['cabina'];
                                _pasoLibre = _formData[_cargaNominal]
                                        ?['puertasData'][_selectedTipoPuerta]
                                    ['pasoLibre'];
                                _dimensionesDucto = _formData[_cargaNominal]
                                        ?['puertasData'][_selectedTipoPuerta]
                                    ['ducto'];
                              });
                            }
                          }
                        } else {
                          setState(() {
                            _dimensionesCabina = "1100x2100";
                            _pasoLibre = "900";
                            _dimensionesDucto = "1650x2480";
                            _selectedTipoPuerta = "T2";
                            _numeroPersonas = "13";
                            pasosLibresIn1000Case = ["900", "1000"];
                          });
                        }
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: _cargaNominal != '1000'
                        ? Visibility(
                            visible: _cargaNominal != '1000',
                            child: FormBuilderDropdown(
                              name: 'tipoPuerta',
                              initialValue: _selectedTipoPuerta,
                              decoration:
                                  InputDecoration(labelText: 'Tipo de Puerta'),
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
                                  _pasoLibre = puertasData[_selectedTipoPuerta]
                                      ['pasoLibre'];
                                  _dimensionesDucto =
                                      puertasData[_selectedTipoPuerta]['ducto'];
                                });
                              },
                            ),
                          )
                        : FormBuilderDropdown(
                            name: 'cabina',
                            initialValue: _dimensionesCabina,
                            decoration:
                                InputDecoration(labelText: 'Medida de cabina'),
                            items: cabinasKeys
                                .map((key) => DropdownMenuItem(
                                      value: key,
                                      child: Text(key),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                pasosLibresIn1000Case = _formData[_cargaNominal]
                                        ?["cabinas"][value]["pasosLibres"]
                                    .keys
                                    .toList();
                                _dimensionesCabina = value.toString();
                                _pasoLibre = pasosLibresIn1000Case[0];
                                _dimensionesDucto = _formData[_cargaNominal]
                                        ?["cabinas"][value]["pasosLibres"]
                                    [_pasoLibre]["ducto"];
                                // Cambia tipo de puerta
                                if (_dimensionesCabina == "2100x1100") {
                                  _selectedTipoPuerta = "C2";
                                } else {
                                  _selectedTipoPuerta = "T2";
                                }
                              });
                            },
                          ),
                  ),
                ],
              ),
              Visibility(
                visible: _cargaNominal == '1000',
                child: FormBuilderDropdown(
                  name: 'pasoLibre',
                  decoration:
                      InputDecoration(labelText: 'Selecciona paso libre'),
                  initialValue: _pasoLibre,
                  items: pasosLibresIn1000Case
                      .map((key) => DropdownMenuItem(
                            value: key,
                            child: Text(key),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(
                      () {
                        _pasoLibre = value.toString();
                        _dimensionesDucto = _formData[_cargaNominal]?["cabinas"]
                            [_dimensionesCabina]["pasosLibres"][value]["ducto"];
                        _selectedTipoPuerta = _formData[_cargaNominal]
                            ?["cabinas"][_dimensionesCabina]["tipoPuerta"];
                        _numeroPersonas =
                            _formData[_cargaNominal]?["numeroPersonas"];
                        _selectedTipoPuerta = _formData[_cargaNominal]
                            ?["cabinas"][_dimensionesCabina]["tipoPuerta"];
                      },
                    );
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Graphic(
                    ducto: _dimensionesDucto,
                    dimensionesCabina: _dimensionesCabina,
                    pasoLibre: _pasoLibre),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.saveAndValidate()) {
                      Map<String, dynamic> formData =
                          Map.from(_formKey.currentState!.value);
                      formData['pasoLibre'] = _pasoLibre;
                      formData['ducto'] = _dimensionesDucto;
                      formData['numeroPersonas'] = _numeroPersonas;
                      formData['cabina'] = _dimensionesCabina;
                      formData['tipoPuerta'] = _selectedTipoPuerta;

                      setState(() {
                        if (_selectedTipoPuerta != "") {
                          fondoDucto = formData['ducto'].split('x')[0];
                          anchoDucto = formData['ducto'].split('x')[1];
                          fondoCabina = formData['cabina'].split('x')[1];
                          anchoCabina = formData['cabina'].split('x')[0];
                        }
                        print(formData);
                      });
                    }
                  },
                  child: Text('Continuar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

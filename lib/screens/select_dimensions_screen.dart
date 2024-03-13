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

  List<String> _tipoPuertaOptions = [];
  List<String> pasosLibresIn1000Case = [];

  //* Core datos
  String _cargaNominal = '';
  String _numeroPersonas = '';
  String _dimensionesCabina = '';
  String _selectedTipoPuerta = '';
  String _pasoLibre = '';
  String _dimensionesDucto = '';

  //* Extra datos
  String fondoDucto = "";
  String anchoDucto = "";
  String fondoCabina = "";
  String anchoCabina = "";

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
                      items: _formData.keys
                          .map(
                            (cargaNominal) => DropdownMenuItem(
                              value: cargaNominal,
                              child: Text(cargaNominal),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        _cargaNominal = value.toString();
                        if (_cargaNominal != "1000") {
                          setState(() {
                            _tipoPuertaOptions =
                                _formData[_cargaNominal]?['tipoPuertaOptions'];
                            _numeroPersonas =
                                _formData[_cargaNominal]?['numeroPersonas'];
                            _dimensionesCabina =
                                _formData[_cargaNominal]?['cabina'];

                            //Elimino datos para que al seleccionar otra carga nominal
                            //no se muestren datos anteriores
                            _selectedTipoPuerta = '';
                            _pasoLibre = '';
                            _dimensionesDucto = '';
                          });
                        } else {
                          setState(() {
                            _dimensionesCabina = "";
                            _pasoLibre = "";
                            pasosLibresIn1000Case = [];                            
                          });
                        }
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: _cargaNominal != '1000'
                        ? Visibility(
                            visible: _tipoPuertaOptions.isNotEmpty,
                            child: FormBuilderDropdown(
                              name: 'tipoPuerta',
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
                              });
                            },
                          ),
                  ),
                ],
              ),
              Visibility(
                visible:
                    pasosLibresIn1000Case.isNotEmpty && _cargaNominal == "1000",
                child: FormBuilderDropdown(
                  name: 'pasoLibre',
                  decoration:
                      InputDecoration(labelText: 'Selecciona paso libre'),
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
                  onPressed: _cargaNominal.isNotEmpty &&
                          _selectedTipoPuerta.isNotEmpty
                      ? () {
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
                                fondoCabina = formData['cabina'].split('x')[0];
                                anchoCabina = formData['cabina'].split('x')[0];
                              }
                              print(formData);
                            });
                          }
                        }
                      : null, // Assign null to disable the button
                  child: Text('Continuar'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      _cargaNominal.isNotEmpty && _selectedTipoPuerta.isNotEmpty
                          ? Colors.orange.shade900 // color habilitado
                          : Colors.grey, // color deshabilitado
                    ),
                    // Aquí puedes añadir más estilos según tus necesidades
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

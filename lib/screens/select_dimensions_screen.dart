import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:ascensores/screens/form_data.dart';
import 'package:ascensores/screens/graphic.dart';

class SelectDimensionsScreen extends StatefulWidget {
  @override
  _SelectDimensionsScreenState createState() => _SelectDimensionsScreenState();
}

class _SelectDimensionsScreenState extends State<SelectDimensionsScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  List<String> _tipoPuertaOptions = [];

  String _cargaNominal = '';
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
        padding: const EdgeInsets.all(16.0),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: FormBuilderDropdown(
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
                          if (_cargaNominal != "1000") {
                            _tipoPuertaOptions =
                                _formData[_cargaNominal]?['tipoPuertaOptions'];
                            _selectedTipoPuerta = '';
                            _numeroPersonas =
                                _formData[_cargaNominal]?['numeroPersonas'];
                            _dimensionesCabina =
                                _formData[_cargaNominal]?['cabina'];
                            _pasoLibre = '';
                            _ducto = '';
                          } else {
                            print("Se selecciono mil");
                          }
                        });
                      },
                    ),
                  ),
                  SizedBox(
                      width: 10), // Ajusta el espacio entre los DropdownButtons
                  Expanded(
                    child: Visibility(
                      visible: _tipoPuertaOptions.isNotEmpty &&
                          _cargaNominal != "1000",
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
                            _pasoLibre =
                                puertasData[_selectedTipoPuerta]['pasoLibre'];
                            _ducto = puertasData[_selectedTipoPuerta]['ducto'];
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Visibility(
                      visible: _cargaNominal == "1000",
                      child: FormBuilderDropdown(
                        name: 'medidaCabina',
                        decoration:
                            InputDecoration(labelText: 'Medida de cabina'),
                        items: cabinasKeys
                            .map((key) => DropdownMenuItem(
                                  value: key,
                                  child: Text(key),
                                ))
                            .toList(),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Graphic(
                    ducto: _ducto,
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

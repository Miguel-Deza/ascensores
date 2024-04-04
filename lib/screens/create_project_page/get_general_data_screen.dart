import 'package:ascensores/screens/create_project_page/duct_design_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

class GetGeneralDataScreen extends StatefulWidget {
  GetGeneralDataScreen({super.key});

  @override
  State<GetGeneralDataScreen> createState() => _GetGeneralDataScreenState();
}

class _GetGeneralDataScreenState extends State<GetGeneralDataScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  String locationMessage = 'Current Location of the User';
  late String lat;
  late String long;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.blue[900],
        elevation: 5.0,
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        title: const Text(
          'Nuevo proyecto',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: FormBuilder(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Ingrese los siguientes datos"),
                FormBuilderTextField(
                  name: 'nombre',
                  decoration: const InputDecoration(
                    labelText: 'NOMBRE DEL PROYECTO',
                  ),
                ),
                FormBuilderTextField(
                  name: 'ruc',
                  decoration: const InputDecoration(
                    labelText: 'RUC',
                  ),
                ),
                FormBuilderTextField(
                  name: 'direccion',
                  decoration: const InputDecoration(
                    labelText: 'DIRECCIÓN',
                  ),
                ),
                FormBuilderTextField(
                  name: 'observaciones',
                  decoration: const InputDecoration(
                    labelText: 'OBSERVACIONES',
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.saveAndValidate()) {
                        print(_formKey.currentState!.value);
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DuctDesignScreen(),
                        ),
                      );
                    },
                    child: const Text('Continuar'),
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

import 'package:ascensores/screens/create_project_page/duct_design_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class GetGeneralDataScreen extends StatefulWidget {
  const GetGeneralDataScreen({super.key});

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
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: FormBuilder(
        key: _formKey,
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height -
                  (MediaQuery.of(context).padding.top + kToolbarHeight),
            ),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        children: [
                          const Text("Ingrese los siguientes datos"),
                          FormBuilderTextField(
                            name: 'nombre',
                            decoration: const InputDecoration(
                              labelText: 'Nombre del proyecto',
                            ),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                            ]),
                          ),
                          FormBuilderTextField(
                            name: 'ruc',
                            decoration: const InputDecoration(
                              labelText: 'RUC (opcional)',
                            ),
                          ),
                          FormBuilderTextField(
                            name: 'direccion',
                            decoration: const InputDecoration(
                              labelText: 'Dirección',
                            ),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                            ]),
                          ),
                          FormBuilderTextField(
                            name: 'observaciones',
                            decoration: const InputDecoration(
                              labelText: 'Observaciones (opcional)',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.saveAndValidate()) {
                          print(_formKey.currentState!.value);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DuctDesignScreen(),
                            ),
                          );
                        }
                      },
                      child: const Text('Continuar'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

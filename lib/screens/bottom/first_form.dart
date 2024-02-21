import 'package:flutter/material.dart';

class FirstForm extends StatefulWidget {
  const FirstForm({super.key});

  @override
  State<FirstForm> createState() => _FirstFormState();
}

enum ColorLabel {
  blue('Blue', Colors.blue),
  pink('Pink', Colors.pink),
  green('Green', Colors.green),
  yellow('Orange', Colors.orange),
  grey('Grey', Colors.grey);

  const ColorLabel(this.label, this.color);
  final String label;
  final Color color;
}

class BuildingUse {
  final String label;
  final String value;
  const BuildingUse({required this.label, required this.value});
}

class _FirstFormState extends State<FirstForm> {
  List<BuildingUse> buildingUses = [
    const BuildingUse(
      label:
          '1. Edificio de oficinas diversas, tipo despachos, consultorios, etc., en área céntrica de alta rentabilidad',
      value:
          'Edificio de oficinas diversas, tipo despachos, consultorios, etc., en área céntrica de alta rentabilidad',
    ),
    const BuildingUse(
      label:
          '2. Edificio similar al anterior, ubicado en un suburbio, o de tipo económico',
      value:
          'Edificio similar al anterior, ubicado en un suburbio, o de tipo económico',
    ),
    const BuildingUse(
      label: '3. Edificio para oficinas perteneciente a una sola compañía',
      value: 'Edificio para oficinas perteneciente a una sola compañía',
    ),
    const BuildingUse(
      label: '4. Edificio de una dependencia gubernamental',
      value: 'Edificio de una dependencia gubernamental',
    ),
    const BuildingUse(
      label: '5. Edificios de departamentos con alta rentabilidad',
      value: 'Edificios de departamentos con alta rentabilidad',
    ),
    const BuildingUse(
      label: '6. Edificios de departamentos con rentabilidad media',
      value: 'Edificios de departamentos con rentabilidad media',
    ),
    const BuildingUse(
      label: '7. Hospital de tipo privado',
      value: 'Hospital de tipo privado',
    ),
    const BuildingUse(
      label: '8. Hospital de tipo estatal',
      value: 'Hospital de tipo estatal',
    ),
    const BuildingUse(
      label: '9. Hotel con alta rentabilidad en área cosmopolita',
      value: 'Hotel con alta rentabilidad en área cosmopolita',
    ),
    const BuildingUse(
      label: '10. Hotel con alta rentabilidad en área en lugar de veraneo',
      value: 'Hotel con alta rentabilidad en área en lugar de veraneo',
    ),
    const BuildingUse(
      label: '11. Hotel con baja rentabilidad en área cosmopolita',
      value: 'Hotel con baja rentabilidad en área cosmopolita',
    ),
    const BuildingUse(
      label: '12. Hotel con baja rentabilidad en área en lugar de veraneo',
      value: 'Hotel con baja rentabilidad en área en lugar de veraneo',
    ),
    const BuildingUse(
      label: '13. Estacionamientos de autoservicio',
      value: 'Estacionamientos de autoservicio',
    ),
    const BuildingUse(
      label: '14. Estacionamiento de autoservicio de una tienda departamental',
      value: 'Estacionamiento de autoservicio de una tienda departamental',
    ),
  ];

  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final myController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController colorController = TextEditingController();
  ColorLabel? selectedColor;
  String? selectedOption;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(60.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButtonFormField<String>(
                    value: selectedOption,
                    iconEnabledColor: Colors.white,
                    isExpanded: true,
                    items: [
                      for (BuildingUse buildingUse in buildingUses)
                        DropdownMenuItem(
                          value: buildingUse.value,
                          child: Text(buildingUse.label),
                        ),
                    ],
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedOption = newValue;
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: 'Selecciona el uso del edificio',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Número de paradas',
                    ),
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingresa algún dato';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Altura del edificio (m)',
                    ),
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingresa algún dato';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Superficie por planta (m2)',
                    ),
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingresa algún dato';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Pisos en zona Express',
                    ),
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingresa algún dato';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Número de unidad por nivel servido',
                    ),
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingresa algún dato';
                      }
                      return null;
                    },
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

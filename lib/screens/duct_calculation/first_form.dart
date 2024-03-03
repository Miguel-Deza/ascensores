import 'package:ascensores/providers/duct_form_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FirstForm extends StatefulWidget {
  final VoidCallback onNextPagePressed;
  final Map<String, dynamic> data;
  final Function(Map<String, dynamic>)? onDataChange;
  const FirstForm(
      {super.key,
      required this.onNextPagePressed,
      required this.data,
      required,
      this.onDataChange});

  @override
  State<FirstForm> createState() => _FirstFormState();
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
  final _formKey = GlobalKey<FormState>();
  //*Controllers
  TextEditingController stopsNumberController = TextEditingController();
  TextEditingController buildingHeightController = TextEditingController();
  TextEditingController floorAreaController = TextEditingController();
  TextEditingController expressZoneFloorsController = TextEditingController();
  TextEditingController unitPerLevelController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<DuctFormProvider>(
      builder: (context, valueProvider, child) => Scaffold(
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(60.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Calculo de ductos',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    DropdownButtonFormField<String>(
                      value: valueProvider.selectedBuildingUse,
                      iconEnabledColor: Colors.white,
                      isExpanded: true,
                      items: valueProvider.testBuildingUseDropdownList.entries
                          .map((entry) {
                        return DropdownMenuItem<String>(
                          value: entry.value,
                          child: Text(entry.key),
                        );
                      }).toList(),
                      onChanged: (value) =>
                          valueProvider.setSelectedBuildingUse(value!),
                      decoration: const InputDecoration(
                        labelText: 'Selecciona el uso del edificio',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    TextFormField(
                      controller: stopsNumberController,
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
                      controller: buildingHeightController,
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
                      controller: floorAreaController,
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
                      controller: expressZoneFloorsController,
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
                      controller: unitPerLevelController,
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
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: ElevatedButton(
                        onPressed: () {
                          valueProvider.setSelectedStopsNumber(
                              stopsNumberController.text.isEmpty
                                  ? '0'
                                  : stopsNumberController.text);

                          valueProvider.setSelectedBuildingHeight(
                              buildingHeightController.text.isEmpty
                                  ? '0'
                                  : buildingHeightController.text);

                          valueProvider.setSelectedFloorArea(
                              floorAreaController.text.isEmpty
                                  ? '0'
                                  : floorAreaController.text);

                          valueProvider.setSelectedExpressZoneFloor(
                              expressZoneFloorsController.text.isEmpty
                                  ? '0'
                                  : expressZoneFloorsController.text);

                          valueProvider.setSelectedUnitPerLevel(
                              unitPerLevelController.text.isEmpty
                                  ? '0'
                                  : unitPerLevelController.text);
                          widget.onNextPagePressed();
                          valueProvider.printDataDuctFormProvider();
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
      ),
    );
  }
}

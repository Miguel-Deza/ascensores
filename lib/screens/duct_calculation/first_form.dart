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
  final _formKey = GlobalKey<FormState>();
  //*Controllers
  TextEditingController stopsNumberController =
      TextEditingController(text: "12");
  TextEditingController buildingHeightController =
      TextEditingController(text: "4");
  TextEditingController floorAreaController =
      TextEditingController(text: "300");
  TextEditingController expressZoneFloorsController =
      TextEditingController(text: "0");
  TextEditingController unitPerLevelController =
      TextEditingController(text: "12");

  @override
  Widget build(BuildContext context) {
    return Consumer<DuctFormProvider>(
      builder: (context, valueProvider, child) => Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width, // Ancho de la pantalla
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/fondo.jpg"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.1), BlendMode.dstATop),
            ),
          ),
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
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    DropdownButtonFormField<String>(
                      value: valueProvider.selectedBuildingUse,
                      iconEnabledColor: Colors.white,
                      isExpanded: true,
                      items: [
                        // Elemento para el título "Oficinas"
                        DropdownMenuItem<String>(
                          child: Container(
                            color: Colors.orange[50],
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 5),
                              child: Row(
                                children: [
                                  Icon(Icons.business),
                                  SizedBox(
                                      width:
                                          8), // Espacio entre el icono y el texto
                                  Text("Oficinas",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ),
                          value:
                              "", // Valor vacío ya que es un título y no representa un elemento seleccionable
                          enabled: false, // No es seleccionable
                        ),
                        // Elementos para las oficinas
                        ...valueProvider.testBuildingUseDropdownList.entries
                            .where((entry) => ["1", "2", "3", "4"].contains(
                                entry.value)) // Filtrar por valores de oficinas
                            .map((entry) {
                          return DropdownMenuItem<String>(
                            value: entry.value,
                            child: Text(entry.key),
                          );
                        }).toList(),
                        // Elemento para el título "Hospitales"
                        DropdownMenuItem<String>(
                          child: Container(
                            color: Colors.orange[50],
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 5),
                              child: Row(
                                children: [
                                  Icon(Icons.local_hospital),
                                  SizedBox(
                                      width:
                                          8), // Espacio entre el icono y el texto
                                  Text("Centros de Salud",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ),
                          value:
                              "", // Valor vacío ya que es un título y no representa un elemento seleccionable
                          enabled: false, // No es seleccionable
                        ),
                        // Elementos para los hospitales
                        ...valueProvider.testBuildingUseDropdownList.entries
                            .where((entry) => ["7", "8"].contains(entry
                                .value)) // Filtrar por valores de hospitales
                            .map((entry) {
                          return DropdownMenuItem<String>(
                            value: entry.value,
                            child: Text(entry.key),
                          );
                        }).toList(),
                        // Elemento para el título "Departamentos"
                        DropdownMenuItem<String>(
                          child: Container(
                            color: Colors.orange[50],
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 5),
                              child: Row(
                                children: [
                                  Icon(Icons.apartment),
                                  SizedBox(
                                      width:
                                          8), // Espacio entre el icono y el texto
                                  Text("Departamentos",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ),
                          value:
                              "", // Valor vacío ya que es un título y no representa un elemento seleccionable
                          enabled: false, // No es seleccionable
                        ),
                        // Elementos para los departamentos
                        ...valueProvider.testBuildingUseDropdownList.entries
                            .where((entry) => ["5", "6"].contains(entry
                                .value)) // Filtrar por valores de departamentos
                            .map((entry) {
                          return DropdownMenuItem<String>(
                            value: entry.value,
                            child: Text(entry.key),
                          );
                        }).toList(),
                        // Elemento para el título "Hoteles"
                        DropdownMenuItem<String>(
                          child: Container(
                            color: Colors.orange[50],
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 5),
                              child: Row(
                                children: [
                                  Icon(Icons.hotel),
                                  SizedBox(
                                      width:
                                          8), // Espacio entre el icono y el texto
                                  Text("Hoteles",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ),
                          value:
                              "", // Valor vacío ya que es un título y no representa un elemento seleccionable
                          enabled: false, // No es seleccionable
                        ),
                        // Elementos para los hoteles
                        ...valueProvider.testBuildingUseDropdownList.entries
                            .where((entry) => ["9", "10", "11", "12"].contains(
                                entry.value)) // Filtrar por valores de hoteles
                            .map((entry) {
                          return DropdownMenuItem<String>(
                            value: entry.value,
                            child: Text(entry.key),
                          );
                        }).toList(),
                        // Elemento para el título "Estacionamientos"
                        DropdownMenuItem<String>(
                          child: Container(
                            color: Colors.orange[50],
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 5),
                              child: Row(
                                children: [
                                  Icon(Icons.local_parking),
                                  SizedBox(
                                      width:
                                          8), // Espacio entre el icono y el texto
                                  Text("Estacionamientos",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ),
                          value:
                              "", // Valor vacío ya que es un título y no representa un elemento seleccionable
                          enabled: false, // No es seleccionable
                        ),
                        // Elementos para los estacionamientos
                        ...valueProvider.testBuildingUseDropdownList.entries
                            .where((entry) => ["13", "14"].contains(entry
                                .value)) // Filtrar por valores de estacionamientos
                            .map((entry) {
                          return DropdownMenuItem<String>(
                            value: entry.value,
                            child: Text(entry.key),
                          );
                        }).toList(),
                      ],
                      onChanged: (value) {
                        //! ERROR DE JACK, comunicarselo mañana
                        if (["7", "8"].contains(value)) {
                          valueProvider.setIsHospital(true);
                          print("Hola, llamada desde aqui");
                          print(valueProvider.isHospital);
                        } else {
                          valueProvider.setIsHospital(false);
                          print(value.runtimeType);
                          print("No se llamo");
                        }
                        print(value);
                        valueProvider.setSelectedBuildingUse(value!);
                      },
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
                          if (_formKey.currentState!.validate()) {
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
      ),
    );
  }
}

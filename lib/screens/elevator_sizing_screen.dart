import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';


class ElevatorForm extends StatefulWidget {
  @override
  _ElevatorFormState createState() => _ElevatorFormState();
}

class _ElevatorFormState extends State<ElevatorForm> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  String selectedNominalLoad = '';
  Map<String, Map<String, dynamic>> data = {
    '375': {
      'numPeople': 5,
      'cabinDimensions': '900x1200',
      'doorType': {
        'C2': {'clearance': 700, 'ductDimensions': '1600x1500'},
        'T2': {'clearance': 800, 'ductDimensions': '1550x1580'},
      }
    },
    '450': {
      'numPeople': 6,
      'cabinDimensions': '1000x1250',
      'doorType': {
        'T2': {'clearance': 800, 'ductDimensions': '1600x1630'},
      }
    },
    '630': {
      'numPeople': 8,
      'cabinDimensions': '1100x1400',
      'doorType': {
        'C2': {'clearance': 700, 'ductDimensions': '1700x1780'},
        'T2': {'clearance': 800, 'ductDimensions': '1700x1780'},
      }
    },
    '800': {
      'numPeople': 10,
      'cabinDimensions': '1350x1400',
      'doorType': {
        'T2': {'clearance': 900, 'ductDimensions': '1950x1780'},
      }
    },
    '1000': {
      'numPeople': 13,
      'cabinDimensions': '',
      'doorType': {
        'T2': {
          '1000': {'ductDimensions': '1650x2480'},
          '1100': {'ductDimensions': '1850x2480'},
        },
        'C2': {
          '1000': {'ductDimensions': '2700x1400'},
          '1200': {'ductDimensions': '2700x1400'},
        },
        'T2_Unique': {
          '1000': {'ductDimensions': '2000x1950'},
        },
      }
    },
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Elevator Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FormBuilder(
          key: _fbKey,
          child: Column(
            children: [
              FormBuilderDropdown(
                name: 'Nominal Load',
                decoration: InputDecoration(labelText: 'Nominal Load'),
                hint: Text('Select Nominal Load'),
                items: data.keys
                    .map((load) => DropdownMenuItem(
                          value: load,
                          child: Text(load),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedNominalLoad = value!;
                  });
                },
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(context),
                ]),
              ),
              SizedBox(height: 20),
              if (selectedNominalLoad.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dimensions:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text('Number of People: ${data[selectedNominalLoad]?['numPeople']}'),
                    Text('Cabin Dimensions: ${data[selectedNominalLoad]?['cabinDimensions']}'),
                    Text('Door Types:'),
                    SizedBox(height: 5),
                    ...(data[selectedNominalLoad]['doorType'] as Map<String, dynamic>).entries.map((entry) {
                      if (entry.key == 'T2_Unique') {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('T2 (Unique)'),
                            SizedBox(height: 5),
                            Text('Clearance: ${entry.value['1000']['ductDimensions']}'),
                          ],
                        );
                      } else {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${entry.key}'),
                            SizedBox(height: 5),
                            Text('Clearance: ${entry.value['clearance']}'),
                            Text('Duct Dimensions: ${entry.value['ductDimensions']}'),
                          ],
                        );
                      }
                    }),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

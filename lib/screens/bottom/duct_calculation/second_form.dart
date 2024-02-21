import 'package:flutter/material.dart';

class SecondForm extends StatefulWidget {
  const SecondForm({super.key});

  @override
  State<SecondForm> createState() => _SecondFormState();
}

class _SecondFormState extends State<SecondForm> {
  final _formKey = GlobalKey<FormState>();
  int? selectedPassengerCount;
  double? selectedWeight;
  int? selectedDoorWidth;
  String? selectedDoorType;

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
                const Text(
                  'Características técnicas',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField<int>(
                  value: selectedPassengerCount,
                  iconEnabledColor: Colors.white,
                  onChanged: (int? newValue) {
                    setState(() {
                      selectedPassengerCount = newValue!;
                    });
                  },
                  items: const [
                    DropdownMenuItem<int>(
                      value: 6,
                      child: Text('6 pasajeros'),
                    ),
                    DropdownMenuItem<int>(
                      value: 8,
                      child: Text('8 pasajeros'),
                    ),
                    DropdownMenuItem<int>(
                      value: 10,
                      child: Text('10 pasajeros'),
                    ),
                    DropdownMenuItem<int>(
                      value: 11,
                      child: Text('11 pasajeros'),
                    ),
                    DropdownMenuItem<int>(
                      value: 13,
                      child: Text('13 pasajeros'),
                    ),
                    DropdownMenuItem<int>(
                      value: 16,
                      child: Text('16 pasajeros'),
                    ),
                    DropdownMenuItem<int>(
                      value: 20,
                      child: Text('20 pasajeros'),
                    ),
                    DropdownMenuItem<int>(
                      value: 23,
                      child: Text('23 pasajeros'),
                    ),
                  ],
                  decoration: const InputDecoration(
                    labelText: 'Cantidad de pasajeros',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField<double>(
                  value: selectedWeight,
                  iconEnabledColor: Colors.white,
                  onChanged: (double? newValue) {
                    setState(() {
                      selectedWeight = newValue!;
                    });
                  },
                  items: const [
                    DropdownMenuItem<double>(
                      value: 0.4,
                      child: Text('0.4 m/s'),
                    ),
                    DropdownMenuItem<double>(
                      value: 0.63,
                      child: Text('0.63 m/s'),
                    ),
                    DropdownMenuItem<double>(
                      value: 1.0,
                      child: Text('1.0 m/s'),
                    ),
                    DropdownMenuItem<double>(
                      value: 1.6,
                      child: Text('1.6 m/s'),
                    ),
                    DropdownMenuItem<double>(
                      value: 1.75,
                      child: Text('1.75 m/s'),
                    ),
                    DropdownMenuItem<double>(
                      value: 2.0,
                      child: Text('2.0 m/s'),
                    ),
                    DropdownMenuItem<double>(
                      value: 3.0,
                      child: Text('3.0 m/s'),
                    ),
                  ],
                  decoration: const InputDecoration(
                    labelText: 'Velocidad del ascensor',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField<int>(
                  value: selectedDoorWidth,
                  iconEnabledColor: Colors.white,
                  onChanged: (int? newValue) {
                    setState(() {
                      selectedDoorWidth = newValue!;
                    });
                  },
                  items: const [
                    DropdownMenuItem<int>(
                      value: 700,
                      child: Text('700 mm'),
                    ),
                    DropdownMenuItem<int>(
                      value: 750,
                      child: Text('750 mm'),
                    ),
                    DropdownMenuItem<int>(
                      value: 800,
                      child: Text('800 mm'),
                    ),
                    DropdownMenuItem<int>(
                      value: 850,
                      child: Text('850 mm'),
                    ),
                    DropdownMenuItem<int>(
                      value: 900,
                      child: Text('900 mm'),
                    ),
                    DropdownMenuItem<int>(
                      value: 1000,
                      child: Text('1000 mm'),
                    ),
                    DropdownMenuItem<int>(
                      value: 1100,
                      child: Text('1100 mm'),
                    ),
                    DropdownMenuItem<int>(
                      value: 1200,
                      child: Text('1200 mm'),
                    ),
                    DropdownMenuItem<int>(
                      value: 1300,
                      child: Text('1300 mm'),
                    ),
                    DropdownMenuItem<int>(
                      value: 1400,
                      child: Text('1400 mm'),
                    ),
                    DropdownMenuItem<int>(
                      value: 1500,
                      child: Text('1500 mm'),
                    ),
                  ],
                  decoration: const InputDecoration(
                    labelText: 'Velocidad del ascensor',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Escoge las puertas del ascensor',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Radio<String>(
                          value: 'Lateral',
                          groupValue: selectedDoorType,
                          fillColor: MaterialStateProperty.all(Colors.white),
                          onChanged: (value) {
                            setState(() {
                              selectedDoorType = value;
                            });
                          },
                        ),
                        const Text('Lateral'),
                      ],
                    ),
                    Row(
                      children: [
                        Radio<String>(
                          value: 'Central',
                          fillColor: MaterialStateProperty.all(Colors.white),
                          groupValue: selectedDoorType,
                          onChanged: (value) {
                            setState(() {
                              selectedDoorType = value;
                            });
                          },
                        ),
                        const Text('Central'),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: ElevatedButton(
                    onPressed: () {
                      // Validate returns true if the form is valid, or false otherwise.
                      if (_formKey.currentState!.validate()) {
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Parametros ingresado con éxito!')),
                        );
                      }
                    },
                    child: const Text('Operar'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

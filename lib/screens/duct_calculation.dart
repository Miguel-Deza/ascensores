import 'package:flutter/material.dart';

class DuctCalculation extends StatefulWidget {
  const DuctCalculation({super.key});

  @override
  State<DuctCalculation> createState() => _DuctCalculationState();
}

class _DuctCalculationState extends State<DuctCalculation> {
  double _value = 0.0;
  double _ductSizeValue = 0.0;

  List<String> cabinas = [
    "900x1200",
    "1000x1250",
    "1100x1400",
    "1350x1400",
    "1100x2100",
    "2100x1100",
    "1400x1600"
  ];

  Map<String, List<String>> ductos = {
    "900x1200": ["1600x1500", "1550x1580"],
    "1000x1250": ["1600x1630"],
    "1100x1400": ["1700x1780", "1700x1780"],
    "1350x1400": ["1950x1780"],
    "1100x2100": ["1650x2480", "1850x2480"],
    "2100x1100": ["2700x1400", "2700x1400"],
    "1400x1600": ["2000x1950"]
  };

  @override
  Widget build(BuildContext context) {
    String selectedOption = cabinas[_value.toInt()];
    List<int> size =
        selectedOption.split('x').map((e) => int.parse(e)).toList();
    int width = size[0] ~/ 10; // Dividir entre 100 para reducir el tamaño
    int height = size[1] ~/ 10; // Dividir entre 100 para reducir el tamaño

    List<String>? availableDuctSizes = ductos[selectedOption];
    bool showDuctSlider = availableDuctSizes!.length > 1;

    String selectedDuctSize = availableDuctSizes[
        _ductSizeValue.toInt().clamp(0, availableDuctSizes.length - 1)];
    List<int> ductSize =
        selectedDuctSize.split('x').map((e) => int.parse(e)).toList();
    int ductWidth =
        ductSize[0] ~/ 10; // Dividir entre 100 para reducir el tamaño
    int ductHeight =
        ductSize[1] ~/ 10; // Dividir entre 100 para reducir el tamaño

    return Scaffold(
      appBar: AppBar(
        title: Text('Calculo de ductos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                SizedBox(
                  width: ductWidth.toDouble(),
                  height: ductHeight.toDouble(),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(width: 10.0, color: Colors.green),
                        left: BorderSide(width: 10.0, color: Colors.green),
                        right: BorderSide(width: 10.0, color: Colors.green),
                        bottom: BorderSide(width: 10.0, color: Colors.green),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Ducto',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: (ductWidth - width) / 2,
                  top: (ductHeight - height) / 2,
                  child: SizedBox(
                    width: width.toDouble(),
                    height: height.toDouble(),
                    child: Container(
                      color: Colors.blue,
                      child: Center(
                        child: Text(
                          'Cabina',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              'Seleccione una medida de cabina:',
              style: TextStyle(fontSize: 20.0),
            ),
            Slider(
              value: _value,
              min: 0.0,
              max: cabinas.length.toDouble() - 1,
              divisions: cabinas.length - 1,
              onChanged: (double newValue) {
                setState(() {
                  _value = newValue;
                  // Asegúrate de restablecer el valor del slider de ducto
                  _ductSizeValue = 0.0;
                });
              },
            ),
            Text(
              selectedOption,
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 20),
            if (showDuctSlider) ...[
              Text(
                'Seleccione una medida de ducto:',
                style: TextStyle(fontSize: 20.0),
              ),
              Slider(
                value: _ductSizeValue,
                min: 0.0,
                max: availableDuctSizes.length.toDouble() - 1,
                divisions: availableDuctSizes.length - 1,
                onChanged: (double newValue) {
                  setState(() {
                    _ductSizeValue = newValue;
                  });
                },
              ),
              Text(
                selectedDuctSize,
                style: TextStyle(fontSize: 18.0),
              ),
            ],
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

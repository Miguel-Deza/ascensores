import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  double squareSize = 100.0; // Tamaño inicial del cuadrado

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cuadrado escalable'),
      ),
      body: GestureDetector(
        onScaleUpdate: (ScaleUpdateDetails details) {
          // Redondear el tamaño del cuadrado al múltiplo de 10 más cercano
          double newSize = (squareSize * details.scale).roundToDouble();
          // Asegurarse de que el nuevo tamaño sea múltiplo de 10
          if (newSize % 10 == 0) {
            setState(() {
              squareSize = newSize;
            });
          }
        },
        child: Center(
          child: Container(
            width: squareSize,
            height: squareSize,
            color: Colors.blue,
            child: Center(
              child: Text(
                '${squareSize.toInt()}m x ${squareSize.toInt()}m', // Muestra las medidas del cuadrado
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
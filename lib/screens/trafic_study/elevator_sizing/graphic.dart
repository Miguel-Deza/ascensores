import 'package:flutter/material.dart';

class Graphic extends StatelessWidget {
  const Graphic({
    super.key,
    required String ducto,
    required String dimensionesCabina,
    required String pasoLibre,
  })  : _ducto = ducto,
        _dimensionesCabina = dimensionesCabina,
        _pasoLibre = pasoLibre;

  final String _ducto;
  final String _dimensionesCabina;
  final String _pasoLibre;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey[300],
      ),
      width: double.infinity,
      height: 380,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RotatedBox(
            quarterTurns: 3,
            child: Text("F.D: ${_ducto != "" ? _ducto.split('x')[1] : ""}",
                style: TextStyle(fontSize: 20, color: Colors.white)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("A.D: ${_ducto.split('x')[0]}",
                  style: TextStyle(fontSize: 20, color: Colors.white)),
              Container(
                width: 260,
                height: 300,
                color: Colors.blue[200],
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 50,
                        height: 150,
                        color: Colors.blue[900],
                      ),
                      Container(
                        width: 20,
                        height: 50,
                        color: Colors.blue[900],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 100,
                            height: 240,
                            color: Colors.blue[800],
                            child: Row(
                              children: [
                                RotatedBox(
                                  quarterTurns: 3,
                                  child: Text(
                                      "F.C: ${_dimensionesCabina != "" ? _dimensionesCabina.split('x')[1] : ""}",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white)),
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${_dimensionesCabina.split('x')[0]}",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                    Text("${_pasoLibre}",
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white))
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 100,
                            height: 5,
                            color: Colors.lightBlue,
                          ),
                          Container(
                            width: 100,
                            height: 5,
                            color: Colors.lightBlueAccent,
                          ),
                        ],
                      ),
                      Container(
                        width: 20,
                        height: 50,
                        color: Colors.blue[900],
                      ),
                    ],
                  ),
                ),
              ), // Separación entre los dos cuadrados
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

Center grapich() {
  return Center(
    child: Container(
      width: 300,
      height: 380,
      color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RotatedBox(
            quarterTurns: 3,
            child: Text("Fondo del ducto: 1550",
                style: TextStyle(fontSize: 20, color: Colors.white)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("Ancho del ducto: 1550",
                  style: TextStyle(fontSize: 20, color: Colors.white)),
              Container(
                width: 220,
                height: 250,
                color: Colors.red,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 50,
                        height: 100,
                        color: Colors.purple,
                      ),
                      Container(
                        width: 20,
                        height: 50,
                        color: Colors.purple,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 100,
                            height: 200,
                            color: Colors.brown,
                            child: Row(
                              children: [
                                RotatedBox(
                                  quarterTurns: 3,
                                  child: Text("1350",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white)),
                                ),
                                Column(
                                  children: [
                                    Text("1350",
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
                            color: Colors.green,
                          ),
                          Container(
                            width: 100,
                            height: 5,
                            color: Colors.orange,
                          ),
                        ],
                      ),
                      Container(
                        width: 20,
                        height: 50,
                        color: Colors.purple,
                      ),
                    ],
                  ),
                ),
              ), // Separación entre los dos cuadrados
            ],
          ),
        ],
      ),
    ),
  );
}

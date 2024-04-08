import 'package:flutter/material.dart';

class TestGraphic extends StatelessWidget {
  const TestGraphic({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Container(
            height: 260,
            width: 270,
            color: Colors.grey[300],
            child: Row(
              children: [
                const RotatedBox(
                  quarterTurns: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 4),
                      ArrowWidget(
                          arrowHeight: 10,
                          color: Colors.black,
                          pointingRight: true), // Flecha izquierda
                      SizedBox(width: 30), // Espacio entre las flechas
                      Center(
                        child: Text(
                          ' F.D: 2403 ',
                        ),
                      ),
                      SizedBox(
                          width: 20), // Espacio entre el texto y las flechas
                      ArrowWidget(
                          arrowHeight: 10,
                          color: Colors.black,
                          pointingRight: false),

                      // Flecha derecha
                    ],
                  ),
                ),
                Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ArrowWidget(
                            arrowHeight: 10,
                            color: Colors.black,
                            pointingRight: true), // Flecha izquierda
                        SizedBox(width: 10), // Espacio entre las flechas
                        Text(
                          '       A.D: 2023      ',
                        ),
                        SizedBox(
                            width: 10), // Espacio entre el texto y las flechas
                        ArrowWidget(
                            arrowHeight: 10,
                            color: Colors.black,
                            pointingRight: false), // Flecha derecha
                      ],
                    ),
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.black,
                              width: 11,
                            ),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        const RotatedBox(
                                          quarterTurns: 3,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              ArrowWidget(
                                                  arrowHeight: 10,
                                                  color: Colors.black,
                                                  pointingRight:
                                                      true), // Flecha izquierda
                                              SizedBox(
                                                  width:
                                                      0), // Espacio entre las flechas
                                              Text(
                                                'FC: 2043',
                                              ),
                                              SizedBox(
                                                  width:
                                                      0), // Espacio entre el texto y las flechas
                                              ArrowWidget(
                                                  arrowHeight: 10,
                                                  color: Colors.black,
                                                  pointingRight: false),
                                              SizedBox(width: 0),
                                              // Flecha derecha
                                            ],
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            const Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                ArrowWidget(
                                                    arrowHeight: 10,
                                                    color: Colors.black,
                                                    pointingRight:
                                                        true), // Flecha izquierda
                                                SizedBox(
                                                    width:
                                                        0), // Espacio entre las flechas
                                                Text(
                                                  'AC: 1234',
                                                ),
                                                SizedBox(
                                                    width:
                                                        0), // Espacio entre el texto y las flechas
                                                ArrowWidget(
                                                    arrowHeight: 10,
                                                    color: Colors.black,
                                                    pointingRight:
                                                        false), // Flecha derecha
                                              ],
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                  color: Colors.black,
                                                  width: 9,
                                                ),
                                              ),
                                              height: 160,
                                              width: 160,
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Container(
                                              color: Colors.black,
                                              height: 10,
                                              width: 100,
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 10),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 9,
                                    ),
                                  ),
                                  height: 120,
                                  width: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 61,
                          child: Container(
                            width: 100,
                            height: 11,
                            color: Colors.white,
                          ),
                        ),
                        const Positioned(
                          top: 201,
                          left: 10,
                          right: 20,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ArrowWidget(
                                  arrowWidth: 30,
                                  arrowHeight: 10,
                                  color: Colors.black,
                                  pointingRight: true), // Flecha izquierda
                              SizedBox(width: 0), // Espacio entre las flechas
                              Text(
                                ' 1234 ',
                              ),
                              SizedBox(
                                  width:
                                      0), // Espacio entre el texto y las flechas
                              ArrowWidget(
                                arrowWidth: 30,
                                arrowHeight: 10,
                                color: Colors.black,
                                pointingRight: false,
                              ), // Flecha derecha
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ArrowPainter extends CustomPainter {
  final double arrowHeight;
  final Color color;
  final bool pointingRight; // Variable para indicar la dirección de la flecha

  ArrowPainter(
      {required this.arrowHeight,
      required this.color,
      required this.pointingRight});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = color;

    final double arrowWidth = size.width / 4; // Ancho de la flecha

    // Dibujar la parte de la "cola" de la flecha
    canvas.drawLine(
      Offset(0, size.height / 2),
      Offset(size.width - arrowWidth, size.height / 2),
      paint,
    );

    // Dibujar la parte de la "cabeza" de la flecha
    final Path path = Path()
      ..moveTo(pointingRight ? arrowWidth : size.width - arrowWidth, 0)
      ..lineTo(pointingRight ? 0 : size.width, size.height / 2)
      ..lineTo(
          pointingRight ? arrowWidth : size.width - arrowWidth, size.height)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class ArrowWidget extends StatelessWidget {
  final double arrowHeight;
  final Color color;
  final bool pointingRight;
  final double arrowWidth;

  const ArrowWidget({
    super.key,
    required this.arrowHeight,
    required this.color,
    required this.pointingRight,
    this.arrowWidth = 50,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(arrowWidth, arrowHeight), // Tamaño de la flecha
      painter: ArrowPainter(
        arrowHeight: arrowHeight,
        color: color,
        pointingRight: pointingRight,
      ),
    );
  }
}

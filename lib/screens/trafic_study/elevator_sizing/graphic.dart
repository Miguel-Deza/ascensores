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
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 4),
                color: Colors.white,
              ),
              height: 40,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 15),
                color: Colors.blueGrey[300],
              ),
              height: 380,
            ),
          ],
        ),
      ],
    );
  }
}

class CustomDraw extends CustomPainter {
  late Paint painter;
  late double radius;
  late double textWidth;

  CustomDraw(Color color, this.textWidth, {this.radius = 0}) {
    painter = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..color = color;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();

    path.moveTo(size.width - ((size.width - textWidth) / 2), 0);

    path.lineTo(size.width - radius, 0);
    path.cubicTo(size.width - radius, 0, size.width, 0, size.width, radius);
    path.lineTo(size.width, size.height - radius);
    path.cubicTo(size.width, size.height - radius, size.width, size.height,
        size.width - radius, size.height);

    path.lineTo(radius, size.height);
    path.cubicTo(radius, size.height, 0, size.height, 0, size.height - radius);

    path.lineTo(0, radius);
    path.cubicTo(0, radius, 0, 0, radius, 0);
    path.lineTo(((size.width - textWidth) / 2), 0);

    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class CustomTitleWidget extends StatefulWidget {
  final double height;
  final double width;
  final double? radius;
  final String title;
  const CustomTitleWidget(
      {Key? key,
      required this.height,
      required this.width,
      required this.title,
      this.radius})
      : super(key: key);

  @override
  State<CustomTitleWidget> createState() => _CustomTitleWidgetState();
}

class _CustomTitleWidgetState extends State<CustomTitleWidget> {
  GlobalKey textKey = GlobalKey();
  double textHeight = 0.0;
  double textWidth = 0.0;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        final textKeyContext = textKey.currentContext;
        if (textKeyContext != null) {
          final box = textKeyContext.findRenderObject() as RenderBox;
          textHeight = box.size.height;
          textWidth = box.size.width;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        CustomPaint(
          child: Container(
            height: widget.height,
            width: widget.width,
          ),
          painter: CustomDraw(
            Colors.red,
            textWidth,
            radius: widget.radius ?? 0,
          ),
        ),
        Positioned(
          top: -textHeight / 2,
          child: Padding(
            key: textKey,
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              widget.title,
            ),
          ),
        )
      ],
    );
  }
}

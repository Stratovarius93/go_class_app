import 'package:flutter/material.dart';

late double imageSize;

class Background extends StatelessWidget {
  final Color colorTopRight1;
  final Color colorTopRight2;
  final Color colorBottomLeft1;
  final Color colorBottomLeft2;
  const Background(
      {Key? key,
      required this.colorTopRight1,
      required this.colorTopRight2,
      required this.colorBottomLeft1,
      required this.colorBottomLeft2})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    imageSize = MediaQuery.of(context).size.width * 0.35;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: CustomPAnimated1(
        color1: colorTopRight1,
        color2: colorTopRight2,
        color3: colorBottomLeft1,
        color4: colorBottomLeft2,
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final List<Color> colorG;
  final List<double> stopsG;

  const MyPainter(this.colorG, this.stopsG);

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final paint = new Paint()
      ..shader = LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        //colors: colorG as List<Color>,
        colors: colorG,
        stops: stopsG,
      ).createShader(rect);
    final path = new Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width * 0.30, size.height, size.width * 0.35, size.height * 0.70);
    path.quadraticBezierTo(size.width * 0.35, size.height * 0.45,
        size.width * 0.55, size.height * 0.45);
    path.quadraticBezierTo(size.width, size.height * 0.50, size.width, 0.0);
    path.lineTo(size.width, 0);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(MyPainter oldDelegate) => true;
}

class MyPainter2 extends CustomPainter {
  final List<Color> colorG;
  final List<double> stopsG;

  const MyPainter2(this.colorG, this.stopsG);

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final paint = new Paint()
      ..shader = LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        //colors: colorG as List<Color>,
        colors: colorG,
        stops: stopsG,
      ).createShader(rect);

    final path = new Path()
      ..moveTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..quadraticBezierTo(size.width * 0.20, 0.0, 0.0, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(MyPainter2 oldDelegate) => true;
}

class CustomPAnimated1 extends StatefulWidget {
  final Color color1;
  final Color color2;
  final Color color3;
  final Color color4;
  const CustomPAnimated1(
      {Key? key,
      required this.color1,
      required this.color2,
      required this.color3,
      required this.color4})
      : super(key: key);
  @override
  _CustomPAnimated1State createState() => _CustomPAnimated1State();
}

class _CustomPAnimated1State extends State<CustomPAnimated1>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000))
      ..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Color> _listColor1;
    List<Color> _listColor2;

    _listColor1 = [widget.color1, widget.color2, widget.color1];
    _listColor2 = [widget.color3, widget.color4, widget.color3];
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RotatedBox(
                quarterTurns: 1,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                      height: imageSize + (22 * _controller.value),
                      width: imageSize + (22 * _controller.value),
                      child: CustomPaint(
                        painter: MyPainter(
                            _listColor1, [0.0, _controller.value, 1.0]),
                      )),
                ),
              ),
              RotatedBox(
                quarterTurns: 1,
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                      //alignment: new Alignment.bottomRight,
                      height: imageSize + (22 * _controller.value),
                      width: imageSize + (22 * _controller.value),
                      //color: Colors.black12,
                      child: CustomPaint(
                        painter: MyPainter2(
                            _listColor2, [0.0, _controller.value, 1.0]),
                      )),
                ),
              )
            ],
          );
        });
  }
}

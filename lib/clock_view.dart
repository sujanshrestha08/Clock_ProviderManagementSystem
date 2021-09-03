import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class ClockView extends StatefulWidget {
  ClockView({Key? key}) : super(key: key);

  @override
  _ClockViewState createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  @override void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) { 
      setState(() { 
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      child: Transform.rotate(
        angle: -pi / 2,
        child: CustomPaint(
          painter: ClockPainter(),
        ),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  var dateTime = DateTime.now();

  //60 sec - 360, 1 sec - 6 degree
  //12 hours - 360, 1 hour - 30 degrees, 1 min -0.5 degrees

  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);

    var innerPaint = Paint()..color = Color(0xFF444974);

    var outerPaint = Paint()
      ..color = Color(0xFFEAECFF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 16;

    var centerPaint = Paint()..color = Color(0xFFEAECFF)
        // ..style = PaintingStyle.stroke
        // ..strokeWidth = 16
        ;

    var hourPaint = Paint()
      ..shader = RadialGradient(colors: [Color(0xFFEA74AB), Color(0xFFC279FB)])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 11;

    var minutePaint = Paint()
      ..shader = RadialGradient(colors: [Color(0xFF748EF6), Color(0xFF77DDFF)])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 8;

    var secondPaint = Paint()
      ..color = Colors.orange.shade300
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5;

    // var dashBrush = Paint()
    //   ..color = Color(0xFFEAECFF)
    //   ..style = PaintingStyle.fill
    //   ..strokeCap = StrokeCap.round
    //   ..strokeWidth = 1;

    canvas.drawCircle(center, radius - 40, innerPaint);
    canvas.drawCircle(center, radius - 40, outerPaint);

    var houHandX = centerX +
        60 * cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    var houHandY = centerX +
        60 * sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    canvas.drawLine(center, Offset(houHandX, houHandY), hourPaint);

    var minHandX = centerX + 80 * cos(dateTime.minute * 6 * pi / 180);
    var minHandY = centerX + 80 * sin(dateTime.minute * 6 * pi / 180);
    canvas.drawLine(center, Offset(minHandX, minHandY), minutePaint);

    var secHandX = centerX + 80 * cos(dateTime.second * 6 * pi / 180);
    var secHandY = centerX + 80 * sin(dateTime.second * 6 * pi / 180);
    canvas.drawLine(center, Offset(secHandX, secHandY), secondPaint);

    canvas.drawCircle(center, 16, centerPaint);

    // var outerCircleRadius = radius;
    // var innerCircleRadius = radius - 14;

    // for(double i = 0; i < 360; i += 12) {
    //   var x1 = centerX + outerCircleRadius *cos(i * pi/180);
    //   var y1 = centerX + outerCircleRadius *sin(i * pi/180);

    //   var x2 = centerX + innerCircleRadius *cos(i * pi/180);
    //   var y2 = centerX + innerCircleRadius *cos(i * pi/180);
    //   // canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);
    // }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

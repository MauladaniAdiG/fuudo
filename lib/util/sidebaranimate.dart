import 'package:app/util/sizer.dart';
import 'package:app/util/textdesign.dart';
import 'package:flutter/material.dart';

class SidebarAnimate extends StatefulWidget {
  @override
  _SidebarAnimateState createState() => _SidebarAnimateState();
}

class _SidebarAnimateState extends State<SidebarAnimate> {
  Offset _offset = Offset(0, 0);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onPanUpdate: (det) {
          _offset = det.localPosition;
          setState(() {});
        },
        onPanEnd: (det) {
          _offset = Offset(0, 0);
          setState(() {});
        },
        child: Stack(
          children: [
            CustomPaint(
              size: Size(sWidth(context) * 0.25, sHeight(context)),
              painter: SidebarPainter(offset: _offset),
            ),
            Column(
              children: [
                Icon(Icons.food_bank),
                TextDesign('Burger'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SidebarPainter extends CustomPainter {
  final Offset? offset;
  const SidebarPainter({this.offset});

  double controlSlide(double width) {
    return offset!.dx == 0
        ? width
        : offset!.dx > width
            ? offset!.dx
            : width + 50;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.red
      ..style
      ..style = PaintingStyle.fill;
    Path path = Path();
    path.moveTo(-size.width, 0);
    path.lineTo(size.width, 0);
    path.quadraticBezierTo(
        controlSlide(size.width), offset!.dy, size.width, size.height);
    path.lineTo(-size.width, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

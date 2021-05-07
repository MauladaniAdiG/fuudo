import 'package:app/models/pojo/mealdetails.dart';
import 'package:app/util/sizer.dart';
import 'package:flutter/material.dart';

class HeadDetail extends StatefulWidget {
  final MealDetails? mealDetails;
  const HeadDetail({this.mealDetails});
  @override
  _HeadDetailState createState() => _HeadDetailState();
}

class _HeadDetailState extends State<HeadDetail> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MakeCirclePath(),
      child: Container(
          height: sHeight(context) * 0.5,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage('${widget.mealDetails?.mealThumb}'),
                  fit: BoxFit.cover))),
    );
  }
}

class MakeCirclePath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var controlPoint = Offset(size.width * 0.5, size.height);
    var endPoint = Offset(size.width, size.height * 0.85);
    Path path = Path()
      ..lineTo(0, size.height * 0.75)
      ..quadraticBezierTo(
          controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy)
      ..lineTo(size.width, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

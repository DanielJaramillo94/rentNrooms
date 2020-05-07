import 'dart:ui';
import 'package:flutter/cupertino.dart';

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();

    path.lineTo(0, size.height - 40);

    var point1 = Offset(size.width * 0.5, size.height - 40);
    var point1Control = Offset(size.width * 0.25, size.height);
    path.quadraticBezierTo(
        point1Control.dx, point1Control.dy, point1.dx, point1.dy);

    var point2 = Offset(size.width, size.height - 20);
    var point2Control = Offset(size.width * 0.75, size.height - 80);
    path.quadraticBezierTo(
        point2Control.dx, point2Control.dy, point2.dx, point2.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
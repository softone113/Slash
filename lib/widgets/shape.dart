import 'dart:math';
import 'package:flutter/cupertino.dart';

class hexagon extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width * .4, 0);
    path.lineTo(size.width * .8, 0);
    path.lineTo(size.width, size.height * .4);
    path.lineTo(size.width * .8, size.height * .8);
    path.lineTo(size.width * .4, size.height * .8);
    path.lineTo(size.width * .2, size.height * .4);
    path.lineTo(size.width * .4, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class hexagonOuter extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width * .4, 0);
    path.lineTo(size.width * .8, 0);
    path.lineTo(size.width, size.height * .4);
    path.lineTo(size.width * .8, size.height * .8);
    path.lineTo(size.width * .4, size.height * .8);
    path.lineTo(0, size.height * .8);
    path.lineTo(size.width * .4, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class Hexagon extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width * .05, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width * .91, size.height * .85);
    path.lineTo(size.width * 0.8, size.height * sqrt(3) / 2);
    path.lineTo(size.width * 0.05, size.height * sqrt(3) / 2);
    path.lineTo(0, size.height * sqrt(3) / 4);
    path.lineTo(size.width * 0.05, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class Hexagons extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width*.05, 0);
    path.lineTo(size.width*.9, 0);
    path.lineTo(size.width, size.height*.75);
    path.lineTo(size.width*0.95, size.height*sqrt(3)/2);
    path.lineTo(size.width*0.05, size.height*sqrt(3)/2);
    path.lineTo(0, size.height*sqrt(3)/4);
    path.lineTo(size.width*0.05,0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
import 'package:flutter/material.dart';
import 'package:path_drawing/path_drawing.dart';

class Clipper extends CustomClipper<Path> {
  Clipper({
    required this.svgPath,
    this.offset = Offset.zero,
    this.x = 0.45,
    this.y = 0.45,
  });

  String svgPath;
  Offset offset;
  double x;
  double y;

  @override
  Path getClip(Size size) {
    var path = parseSvgPathData(svgPath);
    final Matrix4 matrix4 = Matrix4.identity();

    matrix4.scale(1.1, 1.1);

    return path.transform(matrix4.storage).shift(const Offset(-220, 0));
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}

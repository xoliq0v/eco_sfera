// //Copy this CustomPainter code to the Bottom of the File
// import 'package:flutter/cupertino.dart';
//
// class RPSCustomPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Path path_0 = Path();
//     path_0.moveTo(size.width * 1.051282, size.height);
//     path_0.lineTo(size.width * 1.051282, size.height * 0.2404511);
//     path_0.cubicTo(
//         size.width * 1.051282, size.height * 0.2404511, size.width * 0.9654410,
//         size.height * 0.1038018, size.width * 0.7447436,
//         size.height * 0.1196591);
//     path_0.cubicTo(
//         size.width * 0.5240462, size.height * 0.1355164, size.width * 0.4782744,
//         size.height * 0.2209222, size.width * 0.2118038,
//         size.height * 0.06352036);
//     path_0.cubicTo(size.width * 0.2118038, size.height * 0.06352036,
//         size.width * 0.1177997, size.height * -0.002356068,
//         size.width * -0.05384615, size.height * 0.00006506966);
//     path_0.lineTo(size.width * -0.05384615, size.height);
//     path_0.lineTo(size.width * 1.051282, size.height);
//     path_0.close();
//
//     Paint paint_0_fill = Paint()
//       ..style = PaintingStyle.fill;
//     paint_0_fill.color = Color(0xff0d0d0d).withOpacity(1.0);
//     canvas.drawPath(path_0, paint_0_fill);
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }

import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter {
  final BuildContext context;

  RPSCustomPainter(this.context);

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 1.051282, size.height);
    path_0.lineTo(size.width * 1.051282, size.height * 0.2404511);
    path_0.cubicTo(
        size.width * 1.051282, size.height * 0.2404511, size.width * 0.9654410,
        size.height * 0.1038018, size.width * 0.7447436,
        size.height * 0.1196591);
    path_0.cubicTo(
        size.width * 0.5240462, size.height * 0.1355164, size.width * 0.4782744,
        size.height * 0.2209222, size.width * 0.2118038,
        size.height * 0.06352036);
    path_0.cubicTo(size.width * 0.2118038, size.height * 0.06352036,
        size.width * 0.1177997, size.height * -0.002356068,
        size.width * -0.05384615, size.height * 0.00006506966);
    path_0.lineTo(size.width * -0.05384615, size.height);
    path_0.lineTo(size.width * 1.051282, size.height);
    path_0.close();

    Paint paint_0_fill = Paint()
      ..style = PaintingStyle.fill;

    // Use the theme's brightness to set the color
    if (Theme.of(context).brightness == Brightness.dark) {
      paint_0_fill.color = Color(0xff0d0d0d).withOpacity(1.0); // Dark mode color
    } else {
      paint_0_fill.color = Color(0xffffffff).withOpacity(1.0); // Light mode color
    }

    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

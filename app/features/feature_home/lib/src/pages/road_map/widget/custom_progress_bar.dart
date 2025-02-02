import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class CustomProgressBar extends StatelessWidget {
  final double progress; // Value between 0.0 and 1.0
  final double height;
  final Color backgroundColor;
  final Color progressColor;
  final Color iconColor;
  final EdgeInsets padding;

  const CustomProgressBar({
    super.key,
    required this.progress,
    this.height = 8.0,
    this.backgroundColor = const Color(0xFFEEEEEE),
    this.progressColor = Colors.green,
    this.iconColor = Colors.black,
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SizedBox(
            height: height * 3,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                CustomPaint(
                  size: Size(constraints.maxWidth, height * 2.5),
                  painter: _ProgressBarPainter(
                    progress: progress,
                    backgroundColor: backgroundColor,
                    progressColor: progressColor,
                    strokeWidth: height,
                  ),
                ),
                if (progress > 0 && progress < 1)
                  Positioned(
                    left: constraints.maxWidth * progress - height,
                    top: 0,
                    child: SvgPicture.asset(
                      AppIcons.navigatorIcon,
                      width: height * 3,
                      height: height * 3,
                      colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _ProgressBarPainter extends CustomPainter {
  final double progress;
  final Color backgroundColor;
  final Color progressColor;
  final double strokeWidth;

  _ProgressBarPainter({
    required this.progress,
    required this.backgroundColor,
    required this.progressColor,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint backgroundPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.butt  // Changed to butt for flat edges
      ..strokeWidth = strokeWidth;

    final Paint progressPaint = Paint()
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.butt  // Changed to butt for flat edges
      ..strokeWidth = strokeWidth;

    final double centerY = size.height / 2;
    final double progressX = size.width * progress;

    // Draw background line
    canvas.drawLine(
      Offset(0, centerY),
      Offset(size.width, centerY),
      backgroundPaint,
    );

    // Draw progress line
    if (progress > 0) {
      canvas.drawLine(
        Offset(0, centerY),
        Offset(progressX, centerY),
        progressPaint,
      );
    }
  }

  @override
  bool shouldRepaint(_ProgressBarPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.backgroundColor != backgroundColor ||
        oldDelegate.progressColor != progressColor ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
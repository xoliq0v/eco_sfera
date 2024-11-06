import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class RouteCard extends SingleChildRenderObjectWidget {
  final String routeNumber;
  final String routeName;
  final String startIcon;
  final String endIcon;

  const RouteCard({
    super.key,
    required this.routeNumber,
    required this.routeName,
    required this.startIcon,
    required this.endIcon,
  });

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderRouteCard(
      routeNumber: routeNumber,
      routeName: routeName,
      startIcon: startIcon,
      endIcon: endIcon,
      textDirection: Directionality.of(context),
      theme: Theme.of(context),
    );
  }

  @override
  void updateRenderObject(BuildContext context, RenderRouteCard renderObject) {
    renderObject
      ..routeNumber = routeNumber
      ..routeName = routeName
      ..startIcon = startIcon
      ..endIcon = endIcon
      ..textDirection = Directionality.of(context)
      ..theme = Theme.of(context);
  }
}

class RenderRouteCard extends RenderBox {
  String _routeNumber;
  String _routeName;
  String _startIcon;
  String _endIcon;
  TextDirection _textDirection;
  ThemeData _theme;

  TextPainter? _routeNumberPainter;
  TextPainter? _routeNamePainter;

  RenderRouteCard({
    required String routeNumber,
    required String routeName,
    required String startIcon,
    required String endIcon,
    required TextDirection textDirection,
    required ThemeData theme,
  }) : _routeNumber = routeNumber,
        _routeName = routeName,
        _startIcon = startIcon,
        _endIcon = endIcon,
        _textDirection = textDirection,
        _theme = theme {
    _setupTextPainters();
  }

  // Getters and setters
  String get routeNumber => _routeNumber;
  set routeNumber(String value) {
    if (_routeNumber == value) return;
    _routeNumber = value;
    _setupTextPainters();
    markNeedsLayout();
  }

  String get routeName => _routeName;
  set routeName(String value) {
    if (_routeName == value) return;
    _routeName = value;
    _setupTextPainters();
    markNeedsLayout();
  }

  String get startIcon => _startIcon;
  set startIcon(String value) {
    if (_startIcon == value) return;
    _startIcon = value;
    markNeedsPaint();
  }

  String get endIcon => _endIcon;
  set endIcon(String value) {
    if (_endIcon == value) return;
    _endIcon = value;
    markNeedsPaint();
  }

  TextDirection get textDirection => _textDirection;
  set textDirection(TextDirection value) {
    if (_textDirection == value) return;
    _textDirection = value;
    markNeedsLayout();
  }

  ThemeData get theme => _theme;
  set theme(ThemeData value) {
    if (_theme == value) return;
    _theme = value;
    markNeedsPaint();
  }

  void _setupTextPainters() {
    _routeNumberPainter = TextPainter(
      text: TextSpan(
        text: _routeNumber,
        style: _theme.textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w700,
          fontSize: 15,
        ),
      ),
      textDirection: _textDirection,
    );

    _routeNamePainter = TextPainter(
      text: TextSpan(
        text: _routeName,
        style: _theme.textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w700,
          fontSize: 15,
        ),
      ),
      textDirection: _textDirection,
    );
  }

  @override
  void performLayout() {
    size = constraints.constrain(const Size(double.infinity, 155));

    _routeNumberPainter?.layout();
    _routeNamePainter?.layout();
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final canvas = context.canvas;

    // Draw container background
    final paint = Paint()
      ..color = _theme.scaffoldBackgroundColor
      ..style = PaintingStyle.fill;

    final rrect = RRect.fromRectAndRadius(
      offset & size,
      const Radius.circular(25),
    );
    canvas.drawRRect(rrect, paint);

    // Draw icons column
    final iconOffset = offset + const Offset(25, 15);
    _paintIcons(canvas, iconOffset);

    // Draw text column
    final textOffset = offset + const Offset(75, 15);
    _paintTexts(canvas, textOffset);

    // Draw location button
    _paintLocationButton(canvas, offset + Offset(size.width - 70, 15));
  }

  void _paintIcons(Canvas canvas, Offset offset) {
    // Draw start icon
    // In real implementation, you'd load and draw SVG here
    final iconPaint = Paint()..color = Colors.blue;
    canvas.drawCircle(offset + const Offset(20, 20), 20, iconPaint);

    // Draw dashed line
    final dashPaint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 1;

    final dashStart = offset + const Offset(20, 45);
    final dashEnd = offset + const Offset(20, 82);

    _drawDashedLine(canvas, dashStart, dashEnd, dashPaint);

    // Draw end icon
    iconPaint.color = Colors.green;
    canvas.drawCircle(offset + const Offset(20, 100), 20, iconPaint);
  }

  void _paintTexts(Canvas canvas, Offset offset) {
    _routeNumberPainter?.paint(canvas, offset);
    _routeNamePainter?.paint(canvas, offset + const Offset(0, 80));
  }

  void _paintLocationButton(Canvas canvas, Offset offset) {
    final buttonPaint = Paint()
      ..color = _theme.colorScheme.surface;

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(offset.dx, offset.dy, 45, 45),
        const Radius.circular(15),
      ),
      buttonPaint,
    );
  }

  void _drawDashedLine(Canvas canvas, Offset start, Offset end, Paint paint) {
    final dashWidth = 3.0;
    final dashSpace = 3.0;
    final distance = (end - start).distance;
    final count = (distance / (dashWidth + dashSpace)).floor();

    for (var i = 0; i < count; i++) {
      final dashStart = start + (end - start) * (i * (dashWidth + dashSpace)) / distance;
      final dashEnd = dashStart + (end - start) * dashWidth / distance;
      canvas.drawLine(dashStart, dashEnd, paint);
    }
  }

  @override
  bool get sizedByParent => false;

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    return constraints.constrain(const Size(double.infinity, 155));
  }
}
// File: lib/widgets/dashed_rect_border.dart
import 'dart:ui' as ui; // ✅ For ui.lerpDouble
import 'package:flutter/material.dart';

class DashedRectBorder extends ShapeBorder {
  final double dashWidth;
  final double dashSpace;
  final Color color;
  final double strokeWidth;
  final BorderRadius borderRadius;

  const DashedRectBorder({
    this.dashWidth = 6.0,
    this.dashSpace = 4.0,
    this.color = Colors.grey,
    this.strokeWidth = 1.0,
    this.borderRadius = BorderRadius.zero,
  });

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(strokeWidth);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return Path()
      ..addRRect(
        borderRadius.resolve(textDirection).toRRect(rect).deflate(strokeWidth),
      );
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return Path()
      ..addRRect(borderRadius.resolve(textDirection).toRRect(rect));
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double startX = rect.left;
    double endX = rect.right;
    double startY = rect.top;
    double endY = rect.bottom;

    // Draw dashed lines on each side
    _drawDashedLine(canvas, paint, Offset(startX, startY), Offset(endX, startY)); // Top
    _drawDashedLine(canvas, paint, Offset(endX, startY), Offset(endX, endY)); // Right
    _drawDashedLine(canvas, paint, Offset(endX, endY), Offset(startX, endY)); // Bottom
    _drawDashedLine(canvas, paint, Offset(startX, endY), Offset(startX, startY)); // Left
  }

  void _drawDashedLine(Canvas canvas, Paint paint, Offset start, Offset end) {
    double distance = (end - start).distance;
    int dashCount = (distance / (dashWidth + dashSpace)).floor();
    for (int i = 0; i < dashCount; i++) {
      double startFraction = i * (dashWidth + dashSpace) / distance;
      double endFraction = startFraction + (dashWidth / distance);
      Offset dashStart = Offset(
        ui.lerpDouble(start.dx, end.dx, startFraction)!,
        ui.lerpDouble(start.dy, end.dy, startFraction)!,
      );
      Offset dashEnd = Offset(
        ui.lerpDouble(start.dx, end.dx, endFraction)!,
        ui.lerpDouble(start.dy, end.dy, endFraction)!,
      );
      canvas.drawLine(dashStart, dashEnd, paint);
    }
  }

  @override
  ShapeBorder scale(double t) {
    return DashedRectBorder(
      dashWidth: dashWidth * t,
      dashSpace: dashSpace * t,
      strokeWidth: strokeWidth * t,
      color: color,
      borderRadius: borderRadius,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DashedRectBorder &&
          runtimeType == other.runtimeType &&
          dashWidth == other.dashWidth &&
          dashSpace == other.dashSpace &&
          color == other.color &&
          strokeWidth == other.strokeWidth &&
          borderRadius == other.borderRadius;

  @override
  int get hashCode => Object.hash(dashWidth, dashSpace, color, strokeWidth, borderRadius);
}
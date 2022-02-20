import 'dart:math';

import 'package:flutter/material.dart';
import 'package:seven_segment_display/widgets/draw_triangle_shape.dart';

import '../constants.dart';

class LedStrip extends StatelessWidget {
  const LedStrip(
      {Key? key,
      required this.isOn,
      required this.isVertical,
      required this.x,
      required this.y})
      : super(key: key);
  final bool isOn;
  final bool isVertical;
  final double x;
  final double y;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: x,
      top: y,
      child: Transform.rotate(
        angle: isVertical ? pi / 2 : 0,
        alignment: Alignment.topLeft,
        child: Row(
          children: [
            CustomPaint(
              size: const Size(kThickness / 2, kThickness),
              painter: DrawTriangleShape(isOn ? kColor : kOffColor),
            ),
            Container(
              color: isOn ? kColor : kOffColor,
              width: kLength - kThickness,
              height: kThickness - 2,
            ),
            Transform.rotate(
              angle: pi,
              child: CustomPaint(
                size: const Size(5, kThickness),
                painter: DrawTriangleShape(isOn ? kColor : kOffColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

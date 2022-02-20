import 'package:flutter/material.dart';
import 'led.dart';
import '../constants.dart';

class Digit extends StatelessWidget {
  const Digit(
    this.digit, {
    Key? key,
  }) : super(key: key);
  final int digit;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: kLength * 2 + kThickness,
      width: kLength + kThickness,
      child: Stack(
        children: [
          //A
          LedStrip(
            isOn: (digit >> 6) & 1 == 1,
            isVertical: false,
            x: kThickness / 2,
            y: 0,
          ),
          //B
          LedStrip(
            isOn: (digit >> 5) & 1 == 1,
            isVertical: true,
            x: kLength + kThickness,
            y: kThickness / 2,
          ),
          //C
          LedStrip(
            isOn: (digit >> 4) & 1 == 1,
            isVertical: true,
            x: kLength + kThickness,
            y: kThickness / 2 + kLength,
          ),
          //D
          LedStrip(
            isOn: (digit >> 3) & 1 == 1,
            isVertical: false,
            x: kThickness / 2,
            y: (2 * kLength),
          ),
          //E
          LedStrip(
            isOn: (digit >> 2) & 1 == 1,
            isVertical: true,
            x: kThickness,
            y: kThickness / 2 + kLength,
          ),
          //F
          LedStrip(
            isOn: (digit >> 1) & 1 == 1,
            isVertical: true,
            x: kThickness,
            y: kThickness / 2,
          ),
          //G
          LedStrip(
            isOn: (digit >> 0) & 1 == 1,
            isVertical: false,
            x: kThickness / 2,
            y: kLength,
          ),
        ],
      ),
    );
  }
}

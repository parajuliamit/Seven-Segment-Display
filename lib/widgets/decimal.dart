import 'package:flutter/material.dart';
import 'led.dart';
import '../constants.dart';

class Decimal extends StatelessWidget {
  const Decimal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kLength * 2,
      // alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: kThickness,
              width: kThickness,
              decoration:
                  const BoxDecoration(shape: BoxShape.circle, color: kColor)),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: kThickness,
              width: kThickness,
              decoration:
                  const BoxDecoration(shape: BoxShape.circle, color: kColor)),
        ],
      ),
    );
  }
}

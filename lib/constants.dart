import 'package:flutter/material.dart';

import 'widgets/digits.dart';

const kThickness = 20.0;
const kColor = Color.fromRGBO(190, 0, 0, 1);
const kOffColor = Color.fromRGBO(170, 170, 170, 0.125);
const kLength = 80.0;
const kOffset = 20.0;

const List<Widget> numbers = [
  //0
  Digit(0x7E),
  //1
  Digit(0x30),
  //2
  Digit(0x6D),
  //3
  Digit(0x79),
  //4
  Digit(0x33),
  //5
  Digit(0x5B),
  //6
  Digit(0x5F),
  //7
  Digit(0x70),
  //8
  Digit(0x7F),
  //9
  Digit(0x7B),
  //Blank
  Digit(0x00),
];

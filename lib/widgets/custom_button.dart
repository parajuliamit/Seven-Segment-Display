import 'package:flutter/material.dart';
import '../constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.all(15),
        // side: const BorderSide(width: 2.0, color: kColor),
        backgroundColor: kColor,
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
      ),
    );
  }
}

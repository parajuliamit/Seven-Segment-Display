import 'dart:async';

import 'package:flutter/material.dart';
import 'package:seven_segment_display/constants.dart';
import 'package:seven_segment_display/widgets/decimal.dart';

import 'custom_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final Timer timer;
  // int currentDigit = 0;

  // void changeNumber() {
  //   setState(() {
  //     currentDigit = (currentDigit + 1) % 10;
  //   });
  // }
  late DateTime currentTime;
  @override
  void initState() {
    super.initState();
    currentTime = DateTime.now();
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      // changeNumber();
      setState(() {
        currentTime = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FittedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      currentTime.hour < 10
                          ? numbers[10]
                          : numbers[(currentTime.hour / 10).floor()],
                      numbers[currentTime.hour % 10],
                      const Decimal(),
                      currentTime.minute < 10
                          ? numbers[0]
                          : numbers[(currentTime.minute / 10).floor()],
                      numbers[currentTime.minute % 10],
                      const Decimal(),
                      currentTime.second < 10
                          ? numbers[0]
                          : numbers[(currentTime.second / 10).floor()],
                      numbers[currentTime.second % 10],
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                FittedBox(
                  child: Row(
                    children: [
                      CustomButton(
                          text: 'START STOPWATCH',
                          onPressed: () {
                            Navigator.pushNamed(context, '/stopwatch');
                          }),
                      const SizedBox(width: 20),
                      CustomButton(
                          text: '1 MINUTE TIMER',
                          onPressed: () {
                            Navigator.pushNamed(context, '/timer');
                          })
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

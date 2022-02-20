import 'dart:async';

import 'package:flutter/material.dart';
import 'package:seven_segment_display/constants.dart';
import 'package:seven_segment_display/widgets/decimal.dart';

import '../widgets/custom_button.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  late final Timer timer;
  int elapsedTime = 60000;
  bool isRunning = false;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(milliseconds: 67), (Timer t) {
      if (isRunning && elapsedTime > 0) {
        elapsedTime -= 67;
        if (elapsedTime <= 0) {
          elapsedTime = 0;
          isRunning = false;
        }
        setState(() {});
      }
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
                      Visibility(
                        visible: elapsedTime == 60000,
                        child: Row(
                          children: [
                            numbers[0],
                            numbers[1],
                            const Decimal(),
                          ],
                        ),
                      ),
                      (elapsedTime / 1000) % 60 < 10
                          ? numbers[0]
                          : numbers[(((elapsedTime / 1000) % 60) / 10).floor()],
                      numbers[((elapsedTime / 1000).floor() % 60) % 10],
                      const Decimal(),
                      (elapsedTime % 100) < 10
                          ? numbers[0]
                          : numbers[((elapsedTime % 100) / 10).floor()],
                      numbers[(elapsedTime % 100) % 10],
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                FittedBox(
                  child: Row(
                    children: [
                      isRunning
                          ? CustomButton(
                              text: 'STOP',
                              onPressed: () {
                                setState(() {
                                  isRunning = false;
                                });
                              })
                          : elapsedTime == 60000
                              ? CustomButton(
                                  text: 'START',
                                  onPressed: () {
                                    isRunning = true;
                                  })
                              : Row(
                                  children: [
                                    Visibility(
                                      visible: elapsedTime > 0,
                                      child: CustomButton(
                                          text: 'RESUME',
                                          onPressed: () {
                                            isRunning = true;
                                          }),
                                    ),
                                    const SizedBox(width: 20),
                                    CustomButton(
                                        text: 'RESET',
                                        onPressed: () {
                                          setState(() {
                                            elapsedTime = 60000;
                                          });
                                        })
                                  ],
                                ),
                      const SizedBox(width: 20),
                      CustomButton(
                          text: 'GO BACK',
                          onPressed: () {
                            Navigator.pop(context);
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

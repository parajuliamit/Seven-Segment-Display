import 'dart:async';

import 'package:flutter/material.dart';
import 'package:seven_segment_display/constants.dart';
import 'package:seven_segment_display/widgets/decimal.dart';

import '../widgets/custom_button.dart';

class StopWatchPage extends StatefulWidget {
  const StopWatchPage({Key? key}) : super(key: key);

  @override
  State<StopWatchPage> createState() => _StopWatchPageState();
}

class _StopWatchPageState extends State<StopWatchPage> {
  late final Timer timer;
  late final Stopwatch stopwatch;
  late Duration _duration;

  @override
  void initState() {
    super.initState();
    _duration = const Duration(seconds: 0);
    stopwatch = Stopwatch();
    stopwatch.start();

    timer = Timer.periodic(const Duration(milliseconds: 67), (Timer t) {
      if (stopwatch.elapsed.inHours > 99) {
        stopwatch.reset();
      }
      setState(() {
        _duration = stopwatch.elapsed;
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    stopwatch.stop();
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
                      _duration.inMinutes > 10
                          ? numbers[10]
                          : numbers[(_duration.inMinutes / 10).floor()],
                      numbers[_duration.inMinutes % 10],
                      const Decimal(),
                      _duration.inSeconds % 60 < 10
                          ? numbers[0]
                          : numbers[((_duration.inSeconds % 60) / 10).floor()],
                      numbers[(_duration.inSeconds % 60) % 10],
                      const Decimal(),
                      (_duration.inMilliseconds % 100) < 10
                          ? numbers[0]
                          : numbers[
                              ((_duration.inMilliseconds % 100) / 10).floor()],
                      numbers[(_duration.inMilliseconds % 100) % 10],
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                FittedBox(
                  child: Row(
                    children: [
                      stopwatch.isRunning
                          ? CustomButton(
                              text: 'STOP',
                              onPressed: () {
                                stopwatch.stop();
                              })
                          : stopwatch.elapsedMicroseconds == 0
                              ? CustomButton(
                                  text: 'START',
                                  onPressed: () {
                                    stopwatch.start();
                                  })
                              : Row(
                                  children: [
                                    CustomButton(
                                        text: 'RESUME',
                                        onPressed: () {
                                          stopwatch.start();
                                        }),
                                    const SizedBox(width: 20),
                                    CustomButton(
                                        text: 'RESET',
                                        onPressed: () {
                                          stopwatch.reset();
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

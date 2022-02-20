import 'package:flutter/material.dart';
import 'package:seven_segment_display/widgets/home.dart';

import 'screens/stopwatch.dart';
import 'screens/timer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Seven Segment Display',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/stopwatch': (context) => const StopWatchPage(),
        '/timer': (context) => const TimerPage(),
      },
    );
  }
}

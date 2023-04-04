import 'package:flutter/material.dart';

import 'TimerPage/Timer.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: true
      ),
      home:  TimerPage(),
    );
  }
}
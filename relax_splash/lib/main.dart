import 'package:flutter/material.dart';
import 'package:relax_splash/splash%20screen/relax_splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const IntroductionAnimationScreen(),
    );
  }
}

import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Center(
        child: Image.asset(
          'assets/pokemon-png-logo.png',
          width: 100,
          height: 60,
        ),
      ),
    );
  }
}

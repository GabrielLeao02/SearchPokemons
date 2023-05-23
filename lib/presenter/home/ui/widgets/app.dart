
import 'package:flutter/material.dart';
import 'package:pokemon/presenter/home/ui/home.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = ThemeData(
      colorScheme: const ColorScheme.light(
        primary: Color(0xffE8EDF2),
      ),
    );

    return MaterialApp(
      theme: themeData,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Image.asset(
              'assets/pokemon-png-logo.png',
              width: 100,
              height: 60,
            ),
          ),
        ),
        body: const Home(),
      ),
    );
  }
}

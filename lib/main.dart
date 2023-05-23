import 'package:pokemon/dependency_injection/share/injector.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/presenter/home/ui/widgets/app.dart';
import 'package:pokemon/presenter/home/ui/widgets/splash_screen.dart';

void main() async {

  runApp(const SplashScreen());

  await Injector()();

  runApp(const App());

}



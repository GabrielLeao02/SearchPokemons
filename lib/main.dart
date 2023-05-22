import 'package:dio/dio.dart';
import 'package:pokemon/dependency_injection/share/injector.dart';
import 'package:pokemon/features/pokemon/data/datasource/pokemons_species.dart';
import 'package:pokemon/features/pokemon/domain/entities/specie.dart';
import 'package:pokemon/presenter/home/ui/home.dart';
import 'package:flutter/material.dart';

void main() async {
  Injector()();
  PokemonsSpecieDataSourceImpl pokemonsSpecieDataSourceImpl =
      PokemonsSpecieDataSourceImpl(Dio());
  Specie specie = await pokemonsSpecieDataSourceImpl.call(
      param: {'endPoint': 'https://pokeapi.co/api/v2/pokemon-species/1/'},
      fromJson: (json) => Specie.fromJson(json));
  final mappedEntries = specie.flavorTextEntries?.map((entry) => entry.flavorText.toString()).toList();

debugPrint(mappedEntries.toString());


  runApp(const App());
}

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

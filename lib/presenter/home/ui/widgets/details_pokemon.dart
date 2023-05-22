import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokemon/features/pokemon/domain/entities/pokemon_details.dart';
import 'package:pokemon/features/pokemon/domain/entities/specie.dart';
import 'package:pokemon/presenter/home/bloc/pokemon_specie_bloc.dart';
import 'package:pokemon/presenter/home/ui/widgets/flavor_text.dart';
import 'package:pokemon/presenter/home/ui/widgets/gender_rate_date.dart';
import 'package:pokemon/presenter/home/ui/widgets/information_pokemon.dart';
import 'package:pokemon/presenter/home/ui/widgets/pokemon_name.dart';
import 'package:pokemon/presenter/home/ui/widgets/pokemons_image_detail.dart';

class DetailsPokemon extends StatefulWidget {
  final PokemonDetails item;
  const DetailsPokemon({Key? key, required this.item}) : super(key: key);

  @override
  State<DetailsPokemon> createState() => _DetailsPokemonState();
}

class _DetailsPokemonState extends State<DetailsPokemon> {
  late PokemonSpecieBloc pokemonSpecieBloc;
  final themeData = ThemeData(
    colorScheme: const ColorScheme.light(
      primary: Color(0xffE8EDF2),
    ),
  );
  num height = 0.00;
  double weight = 0.00;

  @override
  void initState() {
    super.initState();
    pokemonSpecieBloc = GetIt.instance<PokemonSpecieBloc>();
    pokemonSpecieBloc.loadData(widget.item.species!.url);
    height = widget.item.height! / 10;
    weight = widget.item.weight! / 10;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  'assets/pokemon-png-logo.png',
                  width: 100,
                  height: 60,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Voltar',
                  style: TextStyle(
                    color: Color(0xffFFCC33), // Defina a cor desejada
                    fontSize: 16, // Defina o tamanho de fonte desejado
                    fontWeight:
                        FontWeight.bold, // Defina o peso da fonte desejado
                  ),
                ),
              ),
            ],
          ),
        ),
        body: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(
                  height: 50,
                ),
                PokemonName(widget: widget),
                PokemonImageDetail(widget: widget),
                FlavorText(pokemonSpecieBloc: pokemonSpecieBloc),
                _cardDetails()
              ],
            ),
          ],
        ),
      ),
    );
  }

  Card _cardDetails() {
    return Card(
      color: const Color.fromRGBO(48, 166, 214, 1),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      const InformationPokemon(
                        title: "Height",
                        color: Color(0xffFFCC33),
                      ),
                      InformationPokemon(
                        title: "$height kg",
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                      const InformationPokemon(
                          title: "Weight", color: Color(0xffFFCC33)),
                      InformationPokemon(
                        title: "$weight kg",
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                      const InformationPokemon(
                        title: "Gender",
                        color: Color(0xffFFCC33),
                      ),
                      GenderRate(pokemonSpecieBloc: pokemonSpecieBloc),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      const InformationPokemon(
                        title: "CategoryTiny",
                        color: Color(0xffFFCC33),
                      ),
                      _buildGenusText(),
                      const InformationPokemon(
                        title: "Abilities",
                        color: Color(0xffFFCC33),
                      ),
                      InformationPokemon(
                        title: widget.item.abilities![0].ability!.name!,
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  StreamBuilder<Specie> _buildGenusText() {
    return StreamBuilder<Specie>(
      stream: pokemonSpecieBloc.listPokemonsStrem,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          String? genus;
          for (var entry in snapshot.data!.genera!) {
            if (entry.language!.name == "en") {
              genus = entry.genus;
              break;
            }
          }
          return InformationPokemon(
            title: genus.toString(),
            color: const Color.fromARGB(255, 255, 255, 255),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
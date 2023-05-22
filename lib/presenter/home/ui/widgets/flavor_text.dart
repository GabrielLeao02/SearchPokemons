import 'package:flutter/material.dart';
import 'package:pokemon/features/pokemon/domain/entities/specie.dart';
import 'package:pokemon/presenter/home/bloc/pokemon_specie_bloc.dart';

class FlavorText extends StatelessWidget {
  const FlavorText({
    Key? key,
    required this.pokemonSpecieBloc,
  }) : super(key: key);

  final PokemonSpecieBloc pokemonSpecieBloc;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Specie>(
      stream: pokemonSpecieBloc.listPokemonsStrem,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          String? flavorText;
          for (var entry in snapshot.data!.flavorTextEntries!) {
            if (entry.language!.name == "en") {
              flavorText = entry.flavorText;
              break;
            }
          }

          flavorText = flavorText!.replaceAll('\n', ', ');

          return Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 30, right: 10, left: 10),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                flavorText,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                ),
              ),
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

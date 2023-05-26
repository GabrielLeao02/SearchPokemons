import 'package:flutter/material.dart';
import 'package:pokemon/features/pokemon/domain/entities/specie.dart';
import 'package:pokemon/presenter/home/bloc/pokemon_specie_bloc.dart';

class GenderRate extends StatelessWidget {
  const GenderRate({
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
          final genderRate = snapshot.data!.genderRate;
          Widget imageWidget;

          if (genderRate == 1) {
            imageWidget = Image.asset(
              'assets/male.png',
              height: 22,
            );
          } else if (genderRate == 8) {
            imageWidget = Image.asset(
              'assets/fame.png',
              height: 22,
            );
          } else {
            imageWidget = Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/fame.png',
                  height: 20,
                ),
                Image.asset(
                  'assets/male.png',
                  height: 20,
                ),
              ],
            );
          }

          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Align(
              alignment: Alignment.center,
              child: imageWidget,
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

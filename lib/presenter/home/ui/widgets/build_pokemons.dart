import 'package:flutter/material.dart';
import 'package:pokemon/features/pokemon/domain/entities/pokemon_details.dart';
import 'package:pokemon/presenter/home/ui/widgets/card_pokemon.dart';

class BuildPokemons extends StatelessWidget {
  final List<PokemonDetails> list;

  const BuildPokemons({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        final item = list[index];
        return CardPokemon(item: item);
      },
    );
  }
}

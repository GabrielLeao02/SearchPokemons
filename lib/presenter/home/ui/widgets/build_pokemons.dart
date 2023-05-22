import 'package:flutter/material.dart';
import 'package:pokemon/features/pokemon/data/model/pokemon_details_model.dart';
import 'package:pokemon/presenter/home/ui/widgets/card_pokemon.dart';

class BuildPokemons extends StatelessWidget {
  final List<PokemonDetailsModel> list;

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

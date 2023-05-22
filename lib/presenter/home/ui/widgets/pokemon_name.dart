
import 'package:flutter/material.dart';
import 'package:pokemon/presenter/home/ui/widgets/details_pokemon.dart';

class PokemonName extends StatelessWidget {
  const PokemonName({
    super.key,
    required this.widget,
  });

  final DetailsPokemon widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Text(
        widget.item.name!.substring(0, 1).toUpperCase() +
            widget.item.name!.substring(1).toLowerCase(),
        style: const TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}

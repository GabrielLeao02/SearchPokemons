import 'package:flutter/material.dart';
import 'package:pokemon/presenter/home/ui/widgets/details_pokemon.dart';

class PokemonImageDetail extends StatelessWidget {
  const PokemonImageDetail({
    super.key,
    required this.widget,
  });

  final DetailsPokemon widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 250,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(242, 242, 242, 1),
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: Image.network(
        widget.item.sprites!.backDefault!,
        fit: BoxFit.fill,
        height: 150,
      ),
    );
  }
}

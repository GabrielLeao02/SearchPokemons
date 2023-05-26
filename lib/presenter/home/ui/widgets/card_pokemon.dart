import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/features/pokemon/domain/entities/pokemon_details.dart';
import 'package:pokemon/presenter/home/ui/widgets/details_pokemon.dart';

class CardPokemon extends StatelessWidget {
  const CardPokemon({
    super.key,
    required this.item,
  });

  final PokemonDetails item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            alignment: Alignment.center,
            child: Image(
              image: CachedNetworkImageProvider(item.sprites!.backDefault!),
            ),
          ),
          Text(
            item.name!,
            style: const TextStyle(
                color: Color(0xff195079),
                fontSize: 24,
                fontWeight: FontWeight.w300),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    navigateToDetalhesScreen(context, item);
                  },
                  // ignore: prefer_const_constructors
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffFFCC33)),
                  child: const Text(
                    'Detalhes',
                    style: TextStyle(
                      color: Color(0xff195079),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  void navigateToDetalhesScreen(BuildContext context, PokemonDetails item) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => DetailsPokemon(item: item)));
  }
}

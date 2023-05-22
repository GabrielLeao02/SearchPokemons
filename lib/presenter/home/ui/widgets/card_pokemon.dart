import 'package:flutter/material.dart';
import 'package:pokemon/features/pokemon/data/model/pokemon_details_model.dart';
import 'package:pokemon/presenter/home/ui/widgets/detalhes_pokemon.dart';

class CardPokemon extends StatelessWidget {
  const CardPokemon({
    super.key,
    required this.item,
  });

  final PokemonDetailsModel item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            alignment: Alignment.center,
            child: Image.network(item.sprites!.backDefault!, fit: BoxFit.fill),
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

  void navigateToDetalhesScreen(
      BuildContext context, PokemonDetailsModel item) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => DetalhesPokemon(item: item)));
  }
}

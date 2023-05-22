import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokemon/features/pokemon/domain/entities/pokemon_details.dart';
import 'package:pokemon/presenter/home/bloc/pokemon_bloc.dart';
import 'package:pokemon/presenter/home/ui/widgets/build_pokemons.dart';
import 'package:pokemon/presenter/home/ui/widgets/connection_fail.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late PokemonBloc pokemonBloc;
  @override
  void initState() {
    pokemonBloc = GetIt.instance<PokemonBloc>();
    pokemonBloc.loadData();
    super.initState();
  }

  @override
  void dispose() {
    pokemonBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PokemonEvent>(
      initialData: PokemonEvent.loading,
      stream: pokemonBloc.stream,
      builder: (context, snapshot) {
        if (snapshot.data == PokemonEvent.sucess) {
          return StreamBuilder<List<PokemonDetails>>(
            initialData: const [],
            stream: pokemonBloc.listPokemonsStrem,
            builder: (context, snapshot) {
              return BuildPokemons(
                list: snapshot.data!,
              );
            },
          );
        } else if (snapshot.data == PokemonEvent.fail) {
          return const ConnectionFail();
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

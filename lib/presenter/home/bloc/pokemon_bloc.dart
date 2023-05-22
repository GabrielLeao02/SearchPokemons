import 'dart:async';
import 'package:pokemon/features/pokemon/domain/entities/pokemon_details.dart';
import 'package:pokemon/features/pokemon/domain/entities/pokemon.dart';
import 'package:pokemon/features/pokemon/domain/usecases/pokemon_usecase.dart';
import 'package:pokemon/features/pokemon/domain/usecases/pokemon_list_usecase.dart';

enum PokemonEvent {
  loading,
  sucess,
  fail,
}

class PokemonBloc {
  final PokemonUseCase pokemonUseCase;
  final PokemonListUseCase pokemonsUseCase;
  late List<Pokemon> pokemon;
  late List<PokemonDetails> pokemonDetailsModel = [];

  StreamController<PokemonEvent> controller =
      StreamController<PokemonEvent>.broadcast();

  Stream<PokemonEvent> get stream => controller.stream;

  final StreamController<List<PokemonDetails>> controllerListPokemons =
      StreamController<List<PokemonDetails>>.broadcast();

  Stream<List<PokemonDetails>> get listPokemonsStrem =>
      controllerListPokemons.stream;

  PokemonBloc(this.pokemonUseCase, this.pokemonsUseCase);

  Future<void> loadData() async {
    try {
      List<Pokemon> pokemon = await pokemonsUseCase();

      for (var pokemon in pokemon) {
        PokemonDetails details =
            await pokemonUseCase({"endPoint": pokemon.url});

        pokemonDetailsModel.add(details);
        controllerListPokemons.sink.add(pokemonDetailsModel);
       
        if (pokemonDetailsModel.isNotEmpty) {
          controller.sink.add(PokemonEvent.sucess);
        }
      }
    } catch (e) {
      controller.sink.add(PokemonEvent.fail);
    }
  }

  void showProgress() {
    controller.sink.add(PokemonEvent.loading);
  }

  dispose() {
    controller.close();
    controllerListPokemons.close();
  }
}

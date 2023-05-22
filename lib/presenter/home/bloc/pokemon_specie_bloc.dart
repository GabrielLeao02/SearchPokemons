import 'dart:async';
import 'package:pokemon/features/pokemon/domain/entities/specie.dart';
import 'package:pokemon/features/pokemon/domain/usecases/pokemon_specie.dart';

enum PokemonSpecieEvent {
  loading,
  sucess,
  fail,
}

class PokemonSpecieBloc {
  final PokemonSpecieUseCase pokemonSpecieUseCase;
  late Specie pokemonSpecie;

  StreamController<PokemonSpecieEvent> controller =
      StreamController<PokemonSpecieEvent>.broadcast();

  Stream<PokemonSpecieEvent> get stream => controller.stream;

  final StreamController<Specie> controllerListPokemons =
      StreamController<Specie>.broadcast();

  Stream<Specie> get listPokemonsStrem => controllerListPokemons.stream;

  PokemonSpecieBloc(this.pokemonSpecieUseCase);

  Future<void> loadData(endPoint) async {
    try {
      pokemonSpecie = await pokemonSpecieUseCase({"endPoint": endPoint});
      controllerListPokemons.sink.add(pokemonSpecie);
    } catch (e) {
      controller.sink.add(PokemonSpecieEvent.fail);
    }
  }

  void showProgress() {
    controller.sink.add(PokemonSpecieEvent.loading);
  }

  dispose() {
    controller.close();
  }
}

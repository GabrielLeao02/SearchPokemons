import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pokemon/features/pokemon/data/model/pokemon_details_model.dart';
import 'package:pokemon/features/pokemon/data/model/pokemon_model.dart';
import 'package:pokemon/features/pokemon/domain/usecases/pokemon_usecase.dart';
import 'package:pokemon/features/pokemon/domain/usecases/pokemons_usecase.dart';

enum PokemonEvent {
  loading,
  sucess,
  fail,
}

class PokemonBloc {
  final PokemonUseCase pokemonUseCase;
  final PokemonsUseCase pokemonsUseCase;
  late List<PokemonModel> pokemonModel;
  late List<PokemonDetailsModel> pokemonDetailsModel = [];

  StreamController<PokemonEvent> controller =
      StreamController<PokemonEvent>.broadcast();

  Stream<PokemonEvent> get stream => controller.stream;

  final StreamController<List<PokemonDetailsModel>> controllerListPokemons =
      StreamController<List<PokemonDetailsModel>>.broadcast();

  Stream<List<PokemonDetailsModel>> get listPokemonsStrem =>
      controllerListPokemons.stream;

  PokemonBloc(this.pokemonUseCase, this.pokemonsUseCase);

  Future<void> loadData() async {
    try {
      List<PokemonModel> pokemonModel = await pokemonsUseCase();

      for (var pokemon in pokemonModel) {
        PokemonDetailsModel details =
            await pokemonUseCase({"endPoint": pokemon.url});

        pokemonDetailsModel.add(details);
        controllerListPokemons.sink.add(pokemonDetailsModel);
        debugPrint(details.species!.url.toString());
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

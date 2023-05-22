import 'package:pokemon/features/pokemon/data/model/pokemon_model.dart';

abstract class PokemonListRepository {
  Future<List<PokemonModel>> call();
}

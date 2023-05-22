import 'package:pokemon/features/pokemon/data/model/pokemon_model.dart';

abstract class PokemonsRepository {
  Future<List<PokemonModel>> call();
}

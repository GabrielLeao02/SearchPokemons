import 'package:pokemon/features/pokemon/domain/entities/pokemon.dart';

abstract class PokemonListRepository {
  Future<List<Pokemon>> call();
}

import 'package:pokemon/features/pokemon/domain/entities/pokemon_details.dart';

abstract class PokemonRepository {
  Future<PokemonDetails> call(Map<String, dynamic>? param);
}

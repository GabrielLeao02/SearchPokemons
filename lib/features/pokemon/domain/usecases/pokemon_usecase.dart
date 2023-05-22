import 'package:pokemon/features/pokemon/domain/entities/pokemon_details.dart';
import 'package:pokemon/features/pokemon/domain/repositories/pokemon_repository.dart';

abstract class PokemonUseCase {
  Future<PokemonDetails> call(Map<String, dynamic>? param);
}

class PokemonUseCaseImpl implements PokemonUseCase {
  final PokemonRepository pokemonsRepository;

  PokemonUseCaseImpl(this.pokemonsRepository);

  @override
  Future<PokemonDetails> call(Map<String, dynamic>? param) async => pokemonsRepository(param);
}

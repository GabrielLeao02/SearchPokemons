import 'package:pokemon/features/pokemon/domain/entities/specie.dart';
import 'package:pokemon/features/pokemon/domain/repositories/pekemon_species.dart';

abstract class PokemonSpecieUseCase {
  Future<Specie> call(Map<String, dynamic>? param);
}

class PokemonSpecieUseCaseImpl implements PokemonSpecieUseCase {
  final PokemonSpecieRepository pokemonsRepository;

  PokemonSpecieUseCaseImpl(this.pokemonsRepository);

  @override
  Future<Specie> call(Map<String, dynamic>? param) async =>
      pokemonsRepository(param);
}

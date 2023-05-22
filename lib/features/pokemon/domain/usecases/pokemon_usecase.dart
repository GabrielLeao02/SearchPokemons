import 'package:pokemon/features/pokemon/data/model/pokemon_details_model.dart';
import 'package:pokemon/features/pokemon/domain/repositories/pokemon_repository.dart';

abstract class PokemonUseCase {
  Future<PokemonDetailsModel> call(Map<String, dynamic>? param);
}

class PokemonUseCaseImpl implements PokemonUseCase {
  final PokemonRepository pokemonsRepository;

  PokemonUseCaseImpl(this.pokemonsRepository);

  @override
  Future<PokemonDetailsModel> call(Map<String, dynamic>? param) async => pokemonsRepository(param);
}

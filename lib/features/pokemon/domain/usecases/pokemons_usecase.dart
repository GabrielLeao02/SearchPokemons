import 'package:pokemon/features/pokemon/data/model/pokemon_model.dart';
import 'package:pokemon/features/pokemon/domain/repositories/pokemons_repository.dart';

abstract class PokemonsUseCase {
  Future<List<PokemonModel>> call();
}

class PokemonsUseCaseImpl implements PokemonsUseCase {
  final PokemonsRepository pokemonsRepository;

  PokemonsUseCaseImpl(this.pokemonsRepository);

  @override
  Future<List<PokemonModel>> call() async => pokemonsRepository();
}

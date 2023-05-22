import 'package:pokemon/features/pokemon/data/model/pokemon_model.dart';
import 'package:pokemon/features/pokemon/domain/repositories/pokemons_repository.dart';

abstract class PokemonListUseCase {
  Future<List<PokemonModel>> call();
}

class PokemonListUseCaseImpl implements PokemonListUseCase {
  final PokemonListRepository pokemonsRepository;

  PokemonListUseCaseImpl(this.pokemonsRepository);

  @override
  Future<List<PokemonModel>> call() async => pokemonsRepository();
}

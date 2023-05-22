import 'package:pokemon/features/pokemon/domain/entities/pokemon.dart';
import 'package:pokemon/features/pokemon/domain/repositories/pokemons_repository.dart';

abstract class PokemonListUseCase {
  Future<List<Pokemon>> call();
}

class PokemonListUseCaseImpl implements PokemonListUseCase {
  final PokemonListRepository pokemonsRepository;

  PokemonListUseCaseImpl(this.pokemonsRepository);

  @override
  Future<List<Pokemon>> call() async => pokemonsRepository();
}

import 'package:pokemon/features/pokemon/data/datasource/pokemon_list_datasource.dart';
import 'package:pokemon/features/pokemon/domain/entities/pokemon.dart';
import 'package:pokemon/features/pokemon/domain/entities/pokemon_list_model.dart';
import 'package:pokemon/features/pokemon/domain/repositories/pokemons_repository.dart';

class PokemonListRepositoryImpl implements PokemonListRepository {
  final PokemonListDataSource _dataSource;

  PokemonListRepositoryImpl(this._dataSource);

  @override
  Future<List<Pokemon>> call() async {
     

    List<Pokemon> result = await _dataSource( fromJson: (json) => PokemonList.fromJson(json).results!);

    return result;
  }
}

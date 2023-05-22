import 'package:pokemon/features/pokemon/data/datasource/pokemon_list_datasource.dart';
import 'package:pokemon/features/pokemon/data/model/pokemon_model.dart';
import 'package:pokemon/features/pokemon/data/model/pokemons_model.dart';
import 'package:pokemon/features/pokemon/domain/repositories/pokemons_repository.dart';

class PokemonListRepositoryImpl implements PokemonListRepository {
  final PokemonListDataSource _dataSource;

  PokemonListRepositoryImpl(this._dataSource);

  @override
  Future<List<PokemonModel>> call() async {
     

    List<PokemonModel> result = await _dataSource( fromJson: (json) => PokemonsModel.fromJson(json).results!);

    return result;
  }
}

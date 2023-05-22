import 'package:pokemon/features/pokemon/data/datasource/pokemons_datasource.dart';
import 'package:pokemon/features/pokemon/data/model/pokemon_model.dart';
import 'package:pokemon/features/pokemon/data/model/pokemons_model.dart';
import 'package:pokemon/features/pokemon/domain/repositories/pokemons_repository.dart';

class PokemonsRepositoryImpl implements PokemonsRepository {
  final PokemonsDataSource _dataSource;

  PokemonsRepositoryImpl(this._dataSource);

  @override
  Future<List<PokemonModel>> call() async {
     

    List<PokemonModel> result = await _dataSource( fromJson: (json) => PokemonsModel.fromJson(json).results!);

    return result;
  }
}

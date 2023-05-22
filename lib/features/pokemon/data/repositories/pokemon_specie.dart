import 'package:pokemon/features/pokemon/data/datasource/pokemons_species.dart';
import 'package:pokemon/features/pokemon/domain/entities/specie.dart';
import 'package:pokemon/features/pokemon/domain/repositories/pekemon_species.dart';

class PokemonSpecieRepositoryImpl implements PokemonSpecieRepository {
  final PokemonsSpecieDataSource _dataSource;

  PokemonSpecieRepositoryImpl(this._dataSource);

  @override
  Future<Specie> call(Map<String, dynamic>? param) async {
    Specie result = await _dataSource(
        param: param, fromJson: (json) => Specie.fromJson(json));

    return result;
  }
}

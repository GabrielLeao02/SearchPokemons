import 'package:pokemon/features/pokemon/data/datasource/pokemon_datasource.dart';
import 'package:pokemon/features/pokemon/domain/entities/pokemon_details.dart';
import 'package:pokemon/features/pokemon/domain/repositories/pokemon_repository.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonDataSource _dataSource;

  PokemonRepositoryImpl(this._dataSource);

  @override
  Future<PokemonDetails> call(Map<String, dynamic>? param) async {  

    PokemonDetails result = await _dataSource( param: param,fromJson: (json) => PokemonDetails.fromJson(json));

    return result;
  }
}

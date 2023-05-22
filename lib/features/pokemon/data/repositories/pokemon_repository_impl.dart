import 'package:pokemon/features/pokemon/data/datasource/pokemon_datasource.dart';
import 'package:pokemon/features/pokemon/data/model/pokemon_details_model.dart';
import 'package:pokemon/features/pokemon/domain/repositories/pokemon_repository.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonDataSource _dataSource;

  PokemonRepositoryImpl(this._dataSource);

  @override
  Future<PokemonDetailsModel> call(Map<String, dynamic>? param) async {  

    PokemonDetailsModel result = await _dataSource( param: param,fromJson: (json) => PokemonDetailsModel.fromJson(json));

    return result;
  }
}

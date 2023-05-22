import 'package:dio/dio.dart';
import 'package:pokemon/features/pokemon/data/model/pokemon_details_model.dart';
import 'package:pokemon/share/base/datasource/data_source.dart';

abstract class PokemonDataSource implements DataSource<PokemonDetailsModel> {}

class PokemonDataSourceeImpl implements PokemonDataSource {
  final Dio _httpFacade;

  PokemonDataSourceeImpl(this._httpFacade);

  @override
  Future<PokemonDetailsModel> call(
      {Map<String, dynamic>? param, FromJson? fromJson}) async {
    Response response = await _httpFacade.get(param!['endPoint']);
    Map<String, dynamic> data = response.data;
    return fromJson!(data);
  }
}

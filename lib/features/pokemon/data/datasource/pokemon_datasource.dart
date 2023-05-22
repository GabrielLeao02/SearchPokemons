import 'package:dio/dio.dart';
import 'package:pokemon/features/pokemon/domain/entities/pokemon_details.dart';
import 'package:pokemon/share/base/datasource/data_source.dart';

abstract class PokemonDataSource implements DataSource<PokemonDetails> {}

class PokemonDataSourceeImpl implements PokemonDataSource {
  final Dio _httpFacade;

  PokemonDataSourceeImpl(this._httpFacade);

  @override
  Future<PokemonDetails> call(
      {Map<String, dynamic>? param, FromJson? fromJson}) async {
    Response response = await _httpFacade.get(param!['endPoint']);
    Map<String, dynamic> data = response.data;
    return fromJson!(data);
  }
}

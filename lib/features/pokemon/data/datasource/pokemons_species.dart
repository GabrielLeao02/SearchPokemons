import 'package:dio/dio.dart';
import 'package:pokemon/features/pokemon/domain/entities/specie.dart';
import 'package:pokemon/share/base/datasource/data_source.dart';

abstract class PokemonsSpecieDataSource implements DataSource<Specie> {}

class PokemonsSpecieDataSourceImpl implements PokemonsSpecieDataSource {
final Dio _httpFacade;

  PokemonsSpecieDataSourceImpl(this._httpFacade);

  @override
  Future<Specie> call(
      {Map<String, dynamic>? param, FromJson? fromJson}) async {
    Response response = await _httpFacade.get(param!['endPoint']);
    Map<String, dynamic> data = response.data;
    return fromJson!(data);
  }
}

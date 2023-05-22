import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokemon/features/pokemon/data/datasource/pokemon_datasource.dart';
import 'package:pokemon/features/pokemon/data/model/pokemon_details_model.dart';
import 'package:pokemon/share/base/datasource/data_source.dart';

class DioMock extends Mock implements Dio {}

class PokemonDataSourceImplMock implements PokemonDataSource  {
  // ignore: unused_field
  final Dio _httpFacade;

  PokemonDataSourceImplMock(this._httpFacade);

  @override
  Future<PokemonDetailsModel> call(
      {Map<String, dynamic>? param, FromJson? fromJson}) async {
    
  
    return PokemonDetailsModel();
  }
}

void main() {
  
  late PokemonDataSource datasource;
  late Dio dio;

  setUp(() async {
    dio = DioMock();
    datasource = PokemonDataSourceImplMock(dio);
    
  });

  group('pokemon datasource ...', () {
    test('call', () async {

      var response = await datasource();

      expect(response, isA<PokemonDetailsModel>());
    });
  });
}

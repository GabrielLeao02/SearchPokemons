import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokemon/features/pokemon/data/datasource/pokemon_datasource.dart';
import 'package:pokemon/features/pokemon/domain/entities/pokemon_details.dart';
import 'package:pokemon/share/base/datasource/data_source.dart';

class DioMock extends Mock implements Dio {}

class PokemonDataSourceImplMock implements PokemonDataSource  {
  // ignore: unused_field
  final Dio _httpFacade;

  PokemonDataSourceImplMock(this._httpFacade);

  @override
  Future<PokemonDetails> call(
      {Map<String, dynamic>? param, FromJson? fromJson}) async {
    
  
    return PokemonDetails();
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

      expect(response, isA<PokemonDetails>());
    });
  });
}

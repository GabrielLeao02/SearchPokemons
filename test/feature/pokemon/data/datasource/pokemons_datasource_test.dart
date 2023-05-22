import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokemon/features/pokemon/data/datasource/pokemons_datasource.dart';
import 'package:pokemon/features/pokemon/data/model/pokemon_model.dart';
import 'package:pokemon/share/base/datasource/data_source.dart';

class DioMock extends Mock implements Dio {}

class PokemonsDataSourceImplMock implements PokemonsDataSource {
  // ignore: unused_field
  final Dio _httpFacade;

  PokemonsDataSourceImplMock(this._httpFacade);

  @override
  Future<List<PokemonModel>> call(
      {Map<String, dynamic>? param, FromJson? fromJson}) async {
    
   
    return [PokemonModel(name: "teste name", url: "link")];
  }
}

void main() {

  late PokemonsDataSource datasource;
  late Dio dio;

  setUp(() async {
    dio = DioMock();
    datasource = PokemonsDataSourceImplMock(dio);
    
  });

  group('pokemons datasource ', () {
    test('call', () async {

      var response = await datasource();

      expect(response, isA<List<PokemonModel>>());
    });
  });
}

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokemon/features/pokemon/data/datasource/pokemon_list_datasource.dart';
import 'package:pokemon/features/pokemon/domain/entities/pokemon.dart';
import 'package:pokemon/share/base/datasource/data_source.dart';

class DioMock extends Mock implements Dio {}

class PokemonsDataSourceImplMock implements PokemonListDataSource {
  // ignore: unused_field
  final Dio _httpFacade;

  PokemonsDataSourceImplMock(this._httpFacade);

  @override
  Future<List<Pokemon>> call(
      {Map<String, dynamic>? param, FromJson? fromJson}) async {
    
   
    return [Pokemon(name: "teste name", url: "link")];
  }
}

void main() {

  late PokemonListDataSource datasource;
  late Dio dio;

  setUp(() async {
    dio = DioMock();
    datasource = PokemonsDataSourceImplMock(dio);
    
  });

  group('pokemons datasource ', () {
    test('call', () async {

      var response = await datasource();

      expect(response, isA<List<Pokemon>>());
    });
  });
}

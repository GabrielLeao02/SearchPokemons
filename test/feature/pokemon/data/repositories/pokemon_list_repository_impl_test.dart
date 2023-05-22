import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokemon/features/pokemon/data/datasource/pokemon_list_datasource.dart';
import 'package:pokemon/features/pokemon/domain/entities/pokemon.dart';
import 'package:pokemon/features/pokemon/domain/entities/pokemon_list_model.dart';
import 'package:pokemon/features/pokemon/domain/repositories/pokemons_repository.dart';
import 'package:pokemon/share/base/datasource/data_source.dart';

class DioMock extends Mock implements Dio {}

class PokemonListDataSourceImplMock implements PokemonListDataSource {
  // ignore: unused_field
  final Dio _httpFacade;

  PokemonListDataSourceImplMock(this._httpFacade);

  @override
  Future<List<Pokemon>> call(
      {Map<String, dynamic>? param, FromJson? fromJson}) async {
    return [Pokemon(name: "teste name", url: "link")];
  }
}

class PokemonsRepositoryImplMock implements PokemonListRepository {
  final PokemonListDataSource _dataSource;

  PokemonsRepositoryImplMock(this._dataSource);

  @override
  Future<List<Pokemon>> call() async {
    // ignore: unused_local_variable
    List<Pokemon> result = await _dataSource(
        fromJson: (json) => PokemonList.fromJson(json).results!);

    return [Pokemon()];
  }
}

void main() {
  late PokemonListDataSource datasource;
  late PokemonListRepository pokemonsRepository;
  late Dio dio;

  setUp(() async {
    dio = DioMock();
    datasource = PokemonListDataSourceImplMock(dio);
    pokemonsRepository = PokemonsRepositoryImplMock(datasource);
  });

  group('pokemons repository List<Pokemon> ', () {
    test('pokemon repository call()=> List<Pokemon>', () async {
      var response = await pokemonsRepository();

      expect(response, isA<List<Pokemon>>());
    });
  });
}

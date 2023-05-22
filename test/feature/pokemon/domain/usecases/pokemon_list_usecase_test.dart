import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokemon/features/pokemon/data/datasource/pokemon_list_datasource.dart';
import 'package:pokemon/features/pokemon/data/model/pokemon_model.dart';
import 'package:pokemon/features/pokemon/data/model/pokemons_model.dart';
import 'package:pokemon/features/pokemon/domain/repositories/pokemons_repository.dart';
import 'package:pokemon/features/pokemon/domain/usecases/pokemon_list_usecase.dart';
import 'package:pokemon/share/base/datasource/data_source.dart';

class DioMock extends Mock implements Dio {}

class PokemonListDataSourceImplMock implements PokemonListDataSource {
  // ignore: unused_field
  final Dio _httpFacade;

  PokemonListDataSourceImplMock(this._httpFacade);

  @override
  Future<List<PokemonModel>> call(
      {Map<String, dynamic>? param, FromJson? fromJson}) async {
    return [PokemonModel(name: "teste name", url: "link")];
  }
}

class PokemonsRepositoryImplMock implements PokemonListRepository {
  final PokemonListDataSource _dataSource;

  PokemonsRepositoryImplMock(this._dataSource);

  @override
  Future<List<PokemonModel>> call() async {
    // ignore: unused_local_variable
    List<PokemonModel> result = await _dataSource(
        fromJson: (json) => PokemonsModel.fromJson(json).results!);

    return [PokemonModel()];
  }
}

class PokemonListUseCaseImplMock implements PokemonListUseCase {
  final PokemonListRepository pokemonsRepository;

  PokemonListUseCaseImplMock(this.pokemonsRepository);

  @override
  Future<List<PokemonModel>> call() async => pokemonsRepository();
}

void main() {
  late PokemonListDataSource datasource;
  late PokemonListRepository pokemonsRepository;
  late PokemonListUseCase pokemonListUseCase;
  late Dio dio;

  setUp(() async {
    dio = DioMock();
    datasource = PokemonListDataSourceImplMock(dio);
    pokemonsRepository = PokemonsRepositoryImplMock(datasource);
    pokemonListUseCase = PokemonListUseCaseImplMock(pokemonsRepository);
  });

  group('pokemons repository List<PokemonModel> ', () {
    test('pokemon repository call()=> List<PokemonModel>', () async {
      var response = await pokemonListUseCase();

      expect(response, isA<List<PokemonModel>>());
    });
  });
}

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokemon/features/pokemon/data/datasource/pokemon_datasource.dart';
import 'package:pokemon/features/pokemon/data/model/pokemon_details_model.dart';
import 'package:pokemon/features/pokemon/domain/repositories/pokemon_repository.dart';
import 'package:pokemon/features/pokemon/domain/usecases/pokemon_usecase.dart';
import 'package:pokemon/share/base/datasource/data_source.dart';

class DioMock extends Mock implements Dio {}

class PokemonDataSourceImplMock implements PokemonDataSource {
  // ignore: unused_field
  final Dio _httpFacade;

  PokemonDataSourceImplMock(this._httpFacade);

  @override
  Future<PokemonDetailsModel> call(
      {Map<String, dynamic>? param, FromJson? fromJson}) async {
    return PokemonDetailsModel();
  }
}

class PokemonRepositoryImplMock implements PokemonRepository {
  final PokemonDataSource _dataSource;

  PokemonRepositoryImplMock(this._dataSource);

  @override
  Future<PokemonDetailsModel> call(Map<String, dynamic>? param) async {
    PokemonDetailsModel result = await _dataSource(
        fromJson: (json) => PokemonDetailsModel.fromJson(json));

    return result;
  }
}

class PokemonUseCaseImplMock implements PokemonUseCase {
  final PokemonRepository pokemonsRepository;

  PokemonUseCaseImplMock(this.pokemonsRepository);

  @override
  Future<PokemonDetailsModel> call(Map<String, dynamic>? param) async =>
      pokemonsRepository(param);
}

void main() {
  late PokemonDataSource datasource;
  late PokemonRepository pokemonsRepository;
  late PokemonUseCase pokemonUseCase;
  late Dio dio;

  setUp(() async {
    dio = DioMock();
    datasource = PokemonDataSourceImplMock(dio);
    pokemonsRepository = PokemonRepositoryImplMock(datasource);
    pokemonUseCase = PokemonUseCaseImplMock(pokemonsRepository);
  });

  group(' pokemonUseCase ', () {
    test('pokemonUseCase call() => PokemonDetailsModel', () async {
      var response = await pokemonUseCase({});

      expect(response, isA<PokemonDetailsModel>());
    });
  });
}

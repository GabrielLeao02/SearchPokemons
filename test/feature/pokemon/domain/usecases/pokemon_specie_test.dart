import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokemon/features/pokemon/data/datasource/pokemons_species.dart';
import 'package:pokemon/features/pokemon/domain/entities/specie.dart';
import 'package:pokemon/features/pokemon/domain/repositories/pekemon_species.dart';
import 'package:pokemon/features/pokemon/domain/usecases/pokemon_specie.dart';
import 'package:pokemon/share/base/datasource/data_source.dart';

class DioMock extends Mock implements Dio {}

class PokemonsSpecieDataSourceImplMock implements PokemonsSpecieDataSource {
  // ignore: unused_field
  final Dio _httpFacade;

  PokemonsSpecieDataSourceImplMock(this._httpFacade);

  @override
  Future<Specie> call({Map<String, dynamic>? param, FromJson? fromJson}) async {
    return Specie();
  }
}

class PokemonSpecieRepositoryImplMock implements PokemonSpecieRepository {
  final PokemonsSpecieDataSource _dataSource;

  PokemonSpecieRepositoryImplMock(this._dataSource);

  @override
  Future<Specie> call(Map<String, dynamic>? param) async {
    // ignore: unused_local_variable
    Specie result =
        await _dataSource(fromJson: (json) => Specie.fromJson(json));

    return Specie();
  }
}

class PokemonSpecieUseCaseImplMock implements PokemonSpecieUseCase {
  final PokemonSpecieRepository pokemonsRepository;

  PokemonSpecieUseCaseImplMock(this.pokemonsRepository);

  @override
  Future<Specie> call(Map<String, dynamic>? param) async =>
      pokemonsRepository(param);
}

void main() {
  late PokemonsSpecieDataSource datasource;
  late PokemonSpecieRepository pokemonsRepository;
  late PokemonSpecieUseCase pokemonSpecieUseCase;
  late Dio dio;

  setUp(() async {
    dio = DioMock();
    datasource = PokemonsSpecieDataSourceImplMock(dio);
    pokemonsRepository = PokemonSpecieRepositoryImplMock(datasource);
    pokemonSpecieUseCase = PokemonSpecieUseCaseImplMock(pokemonsRepository);
  });

  group('pokemonSpecieUseCase', () {
    test('pokemonSpecieUseCase call()=> Specie', () async {
      var response = await pokemonSpecieUseCase({});

      expect(response, isA<Specie>());
    });
  });
}

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokemon/features/pokemon/data/datasource/pokemon_datasource.dart';
import 'package:pokemon/features/pokemon/domain/entities/pokemon_details.dart';
import 'package:pokemon/features/pokemon/domain/repositories/pokemon_repository.dart';
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

class PokemonRepositoryImplMock implements PokemonRepository {
  final PokemonDataSource _dataSource;

  PokemonRepositoryImplMock(this._dataSource);

  @override
  Future<PokemonDetails> call(Map<String, dynamic>? param) async {
    PokemonDetails result = await _dataSource(
        fromJson: (json) => PokemonDetails.fromJson(json));

    return result;
  }
}

void main() {
  late PokemonDataSource datasource;
  late PokemonRepository pokemonsRepository;
  late Dio dio;

  setUp(() async {
    dio = DioMock();
    datasource = PokemonDataSourceImplMock(dio);
    pokemonsRepository = PokemonRepositoryImplMock(datasource);
  });

  group('pokemon repository ', () {
    test('pokemon repository call() => PokemonDetailsModel', () async {
      var response = await pokemonsRepository({});

      expect(response, isA<PokemonDetails>());
    });
  });
}

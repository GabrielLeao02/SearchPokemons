import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokemon/features/pokemon/data/datasource/pokemons_species.dart';
import 'package:pokemon/features/pokemon/domain/entities/specie.dart';
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

void main() {
  late PokemonsSpecieDataSource datasource;
  late Dio dio;

  setUp(() async {
    dio = DioMock();
    datasource = PokemonsSpecieDataSourceImplMock(dio);
  });

  group('pokemons species ...', () {
    test('call', () async {
      var response = await datasource();

      expect(response, isA<Specie>());
    });
  });
}

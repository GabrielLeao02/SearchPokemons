import 'package:pokemon/features/pokemon/domain/entities/specie.dart';

abstract class PokemonSpecieRepository {
  Future<Specie> call(Map<String, dynamic>? param);
}

import 'package:pokemon/features/pokemon/data/model/pokemon_details_model.dart';

abstract class PokemonRepository {
  Future<PokemonDetailsModel> call(Map<String, dynamic>? param);
}

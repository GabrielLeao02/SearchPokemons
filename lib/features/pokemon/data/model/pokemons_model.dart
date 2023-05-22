import 'package:pokemon/features/pokemon/data/model/pokemon_model.dart';

abstract class Model {
  Model.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson();
}

class PokemonsModel extends Model {
  int? count;
  String? next;
  String? previous;
  List<PokemonModel>? results;

  PokemonsModel({
    this.count,
    this.next,
    this.previous,
    this.results,
  }) : super.fromJson({});

  factory PokemonsModel.fromJson(Map<String, dynamic> json) {
    List<PokemonModel> listPokemons = [];
    return PokemonsModel(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: json['results'] != null
          ? List<PokemonModel>.from(
              json['results'].map((x) => PokemonModel.fromJson(x)),
            )
          : listPokemons,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'count': count,
      'next': next,
      'previous': previous,
    };

    if (results != null) {
      data['results'] = results!.map((x) => x.toJson()).toList();
    }

    return data;
  }
}

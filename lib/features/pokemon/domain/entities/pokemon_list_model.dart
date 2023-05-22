import 'package:pokemon/features/pokemon/domain/entities/pokemon.dart';

abstract class Model {
  Model.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson();
}

class PokemonList extends Model {
  int? count;
  String? next;
  String? previous;
  List<Pokemon>? results;

  PokemonList({
    this.count,
    this.next,
    this.previous,
    this.results,
  }) : super.fromJson({});

  factory PokemonList.fromJson(Map<String, dynamic> json) {
    List<Pokemon> listPokemons = [];
    return PokemonList(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: json['results'] != null
          ? List<Pokemon>.from(
              json['results'].map((x) => Pokemon.fromJson(x)),
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

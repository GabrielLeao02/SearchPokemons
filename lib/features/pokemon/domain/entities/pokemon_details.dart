import 'package:pokemon/features/pokemon/domain/entities/abilities.dart';
import 'package:pokemon/features/pokemon/domain/entities/species.dart';
import 'package:pokemon/features/pokemon/domain/entities/sprites.dart';

class PokemonDetails {
  int? height;
  int? id;
  String? name;
  Sprites? sprites;
  int? weight;
  Species? species;
  List<Abilities>? abilities;

  PokemonDetails(
      {this.height,
      this.id,
      this.name,
      this.sprites,
      this.weight,
      this.species});

  PokemonDetails.fromJson(Map<String, dynamic> json) {
    height = json['height'];

    id = json['id'];

    name = json['name'];
    sprites =
        json['sprites'] != null ? Sprites.fromJson(json['sprites']) : null;
    species =
        json['species'] != null ? Species.fromJson(json['species']) : null;
    weight = json['weight'];

    if (json['abilities'] != null) {
      abilities = <Abilities>[];
      json['abilities'].forEach((v) {
        abilities!.add(Abilities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['height'] = height;
    data['id'] = id;
    data['name'] = name;
    if (sprites != null) {
      data['sprites'] = sprites!.toJson();
    }
    if (species != null) {
      data['species'] = species!.toJson();
    }
    if (abilities != null) {
      data['abilities'] = abilities!.map((v) => v.toJson()).toList();
    }
    data['weight'] = weight;
    return data;
  }
}

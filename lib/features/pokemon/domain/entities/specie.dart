import 'package:pokemon/features/pokemon/domain/entities/genera.dart';
import 'package:pokemon/features/pokemon/domain/entities/language.dart';

class Specie {
  List<FlavorTextEntries>? flavorTextEntries;
  List<Genera>? genera;
  int? genderRate;

  Specie({
    this.flavorTextEntries,
    this.genderRate,
    this.genera,
  });

  Specie.fromJson(Map<String, dynamic> json) {
    if (json['flavor_text_entries'] != null) {
      flavorTextEntries = <FlavorTextEntries>[];
      genderRate = json['gender_rate'];
      json['flavor_text_entries'].forEach((v) {
        flavorTextEntries!.add(FlavorTextEntries.fromJson(v));
      });
    }
    genderRate = json['gender_rate'];
    if (json['genera'] != null) {
      genera = <Genera>[];
      json['genera'].forEach((v) {
        genera!.add( Genera.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (flavorTextEntries != null) {
      data['flavor_text_entries'] =
          flavorTextEntries!.map((v) => v.toJson()).toList();
    }
    if (genera != null) {
      data['genera'] = genera!.map((v) => v.toJson()).toList();
    }
    data['gender_rate'] = genderRate;
    return data;
  }
}

class FlavorTextEntries {
  String? flavorText;
  Language? language;

  FlavorTextEntries({this.flavorText});

  FlavorTextEntries.fromJson(Map<String, dynamic> json) {
    flavorText = json['flavor_text'];
    language =
        json['language'] != null ? Language.fromJson(json['language']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['flavor_text'] = flavorText;
    if (language != null) {
      data['language'] = language!.toJson();
    }
    return data;
  }
}

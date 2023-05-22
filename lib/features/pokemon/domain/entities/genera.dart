import 'package:pokemon/features/pokemon/domain/entities/language.dart';

class Genera {
  String? genus;
  Language? language;

  Genera({this.genus, this.language});

  Genera.fromJson(Map<String, dynamic> json) {
    genus = json['genus'];
    language =
        json['language'] != null ?  Language.fromJson(json['language']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['genus'] = genus;
    if (language != null) {
      data['language'] = language!.toJson();
    }
    return data;
  }
}

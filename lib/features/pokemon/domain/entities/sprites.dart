class Sprites {
  String? backDefault;

  Sprites({
    this.backDefault,
  });

  Sprites.fromJson(Map<String, dynamic> json) {
    backDefault = json['back_default'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['back_default'] = backDefault;
    return data;
  }
}

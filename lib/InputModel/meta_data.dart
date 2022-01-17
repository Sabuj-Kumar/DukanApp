import 'dart:convert';

Meta_data meta_dataFromJson(String str) => Meta_data.fromJson(json.decode(str));
String meta_dataToJson(Meta_data data) => json.encode(data.toJson());

class Meta_data {
  Meta_data({
    this.id,
    this.key,
    this.value,
  });

  Meta_data.fromJson(dynamic json) {
    id = json['id'];
    key = json['key'];
    value = json['value'];
  }
  int? id;
  String? key;
  String? value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['key'] = key;
    map['value'] = value;
    return map;
  }
}

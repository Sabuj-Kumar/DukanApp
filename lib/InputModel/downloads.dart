import 'dart:convert';

Downloads downloadsFromJson(String str) => Downloads.fromJson(json.decode(str));
String downloadsToJson(Downloads data) => json.encode(data.toJson());

class Downloads {
  Downloads({
    this.id,
    this.name,
    this.file,
  });

  Downloads.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    file = json['file'];
  }
  String? id;
  String? name;
  String? file;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['file'] = file;
    return map;
  }
}

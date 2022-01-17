import 'dart:convert';

Dimensions dimensionsFromJson(String str) =>
    Dimensions.fromJson(json.decode(str));
String dimensionsToJson(Dimensions data) => json.encode(data.toJson());

class Dimensions {
  Dimensions({
    this.length,
    this.width,
    this.height,
  });

  Dimensions.fromJson(dynamic json) {
    length = json['length'];
    width = json['width'];
    height = json['height'];
  }
  String? length;
  String? width;
  String? height;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['length'] = length;
    map['width'] = width;
    map['height'] = height;
    return map;
  }
}

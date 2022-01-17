import 'dart:convert';

Self selfFromJson(String str) => Self.fromJson(json.decode(str));
String selfToJson(Self data) => json.encode(data.toJson());

class Self {
  Self({
    this.href,
  });

  Self.fromJson(dynamic json) {
    href = json['href'];
  }
  String? href;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['href'] = href;
    return map;
  }
}

import 'dart:convert';

Collection collectionFromJson(String str) =>
    Collection.fromJson(json.decode(str));
String collectionToJson(Collection data) => json.encode(data.toJson());

class Collection {
  Collection({
    this.href,
  });

  Collection.fromJson(dynamic json) {
    href = json['href'];
  }
  String? href;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['href'] = href;
    return map;
  }
}

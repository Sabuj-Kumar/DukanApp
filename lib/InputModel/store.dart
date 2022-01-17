import 'address.dart';
import 'dart:convert';

Store storeFromJson(String str) => Store.fromJson(json.decode(str));
String storeToJson(Store data) => json.encode(data.toJson());

class Store {
  Store({
    this.id,
    this.name,
    this.url,
    this.avatar,
    this.address,
  });

  Store.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
    avatar = json['avatar'];
    address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
  }
  int? id;
  String? name;
  String? url;
  String? avatar;
  Address? address;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['url'] = url;
    map['avatar'] = avatar;
    if (address != null) {
      map['address'] = address?.toJson();
    }
    return map;
  }
}

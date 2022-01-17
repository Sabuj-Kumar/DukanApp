import 'self.dart';
import 'collection.dart';
import 'dart:convert';

_links _linksFromJson(String str) => _links.fromJson(json.decode(str));
String _linksToJson(_links data) => json.encode(data.toJson());

class _links {
  _links({
    this.self,
    this.collection,
  });

  _links.fromJson(dynamic json) {
    if (json['self'] != null) {
      self = [];
      json['self'].forEach((v) {
        self?.add(Self.fromJson(v));
      });
    }
    if (json['collection'] != null) {
      collection = [];
      json['collection'].forEach((v) {
        collection?.add(Collection.fromJson(v));
      });
    }
  }
  List<Self>? self;
  List<Collection>? collection;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (self != null) {
      map['self'] = self?.map((v) => v.toJson()).toList();
    }
    if (collection != null) {
      map['collection'] = collection?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

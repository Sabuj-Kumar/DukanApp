import 'dart:convert';

Address addressFromJson(String str) => Address.fromJson(json.decode(str));
String addressToJson(Address data) => json.encode(data.toJson());

class Address {
  Address({
    this.street1,
    this.street2,
    this.city,
    this.zip,
    this.country,
    this.state,
  });

  Address.fromJson(dynamic json) {
    street1 = json['street_1'];
    street2 = json['street_2'];
    city = json['city'];
    zip = json['zip'];
    country = json['country'];
    state = json['state'];
  }
  String? street1;
  String? street2;
  String? city;
  String? zip;
  String? country;
  String? state;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['street_1'] = street1;
    map['street_2'] = street2;
    map['city'] = city;
    map['zip'] = zip;
    map['country'] = country;
    map['state'] = state;
    return map;
  }
}

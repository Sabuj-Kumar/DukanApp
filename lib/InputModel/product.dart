import 'categories.dart';
import 'images.dart';
import 'store.dart';
import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({
    this.id,
    this.name,
    this.postAuthor,
    this.permalink,
    this.dateCreated,
    this.dateModified,
    this.type,
    this.status,
    this.featured,
    this.description,
    this.shortDescription,
    this.price,
    this.regularPrice,
    this.salePrice,
    this.priceHtml,
    this.onSale,
    this.totalSales,
    this.weight,
    this.shippingRequired,
    this.shippingTaxable,
    this.shippingClass,
    this.shippingClassId,
    this.averageRating,
    this.ratingCount,
    this.purchaseNote,
    this.categories,
    this.images,
    this.store,
  });

  Product.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    postAuthor = json['post_author'];
    permalink = json['permalink'];
    dateCreated = json['date_created'];
    dateModified = json['date_modified'];
    type = json['type'];
    status = json['status'];
    featured = json['featured'];
    description = json['description'];
    shortDescription = json['short_description'];
    price = json['price'];
    regularPrice = json['regular_price'];
    salePrice = json['sale_price'];
    priceHtml = json['price_html'];
    onSale = json['on_sale'];
    totalSales = json['total_sales'];

    weight = json['weight'];
    shippingRequired = json['shipping_required'];
    shippingTaxable = json['shipping_taxable'];
    shippingClass = json['shipping_class'];
    shippingClassId = json['shipping_class_id'];
    averageRating = json['average_rating'];
    ratingCount = json['rating_count'];

    purchaseNote = json['purchase_note'];
    if (json['categories'] != null) {
      categories = [];
      json['categories'].forEach((v) {
        categories?.add(Categories.fromJson(v));
      });
    }
    if (json['images'] != null) {
      images = [];
      json['images'].forEach((v) {
        images?.add(Images.fromJson(v));
      });
    }

    store = json['store'] != null ? Store.fromJson(json['store']) : null;
  }

  static List<Product> fromList(dynamic json) => List<Product>.from(
        json.map(
          (e) => Product.fromJson(e),
        ),
      );
  int? id;
  String? name;
  String? postAuthor;
  String? permalink;
  String? dateCreated;
  String? dateModified;
  String? type;
  String? status;
  bool? featured;
  String? description;
  String? shortDescription;
  String? price;
  String? regularPrice;
  String? salePrice;
  String? priceHtml;
  bool? onSale;
  int? totalSales;
  String? weight;
  bool? shippingRequired;
  bool? shippingTaxable;
  String? shippingClass;
  int? shippingClassId;
  String? averageRating;
  int? ratingCount;
  String? purchaseNote;
  List<Categories>? categories;
  List<Images>? images;
  Store? store;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['post_author'] = postAuthor;
    map['permalink'] = permalink;
    map['date_created'] = dateCreated;
    map['date_modified'] = dateModified;
    map['type'] = type;
    map['status'] = status;
    map['featured'] = featured;
    map['description'] = description;
    map['short_description'] = shortDescription;
    map['price'] = price;
    map['regular_price'] = regularPrice;
    map['sale_price'] = salePrice;
    map['price_html'] = priceHtml;
    map['on_sale'] = onSale;
    map['total_sales'] = totalSales;
    map['weight'] = weight;
    map['shipping_required'] = shippingRequired;
    map['shipping_taxable'] = shippingTaxable;
    map['shipping_class'] = shippingClass;
    map['shipping_class_id'] = shippingClassId;
    map['average_rating'] = averageRating;
    map['rating_count'] = ratingCount;
    map['purchase_note'] = purchaseNote;
    if (categories != null) {
      map['categories'] = categories?.map((v) => v.toJson()).toList();
    }

    if (images != null) {
      map['images'] = images?.map((v) => v.toJson()).toList();
    }
    if (store != null) {
      map['store'] = store?.toJson();
    }
    return map;
  }
}

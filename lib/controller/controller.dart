import 'dart:convert';

import 'package:dokan/InputModel/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class FileController extends ChangeNotifier {
  List<Product> productData = [];

  void loadProductsFromAssets(String key) {
    rootBundle.loadString(key).then((value) {
      //print(value);
      productData = Product.fromList(jsonDecode(value));
      notifyListeners();
    });
  }
}

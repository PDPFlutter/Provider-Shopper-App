import 'package:flutter/material.dart';
import 'package:provider_shopper/models/category_model.dart';
import 'package:provider_shopper/models/product_model.dart';
import 'package:provider_shopper/service/mock_data.dart';

class ProductsProvider extends ChangeNotifier {
  final String categoryId;
  late Category category;

  ProductsProvider({required this.categoryId}) {
    getCategory();
    getProducts();
  }

  void getCategory() {
    category = Category.fromJson(categoriesMock.firstWhere((category) => categoryId == category["id"]));
  }

  void getProducts() {
    final products = productsMock
        .where((product) => product["categoryId"] == categoryId)
        .map((product) => Product.fromJson(product)).toList();
    category = category.copyWith(products: products);
  }
}
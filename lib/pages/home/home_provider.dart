import 'package:flutter/material.dart';
import 'package:provider_shopper/models/category_model.dart';
import 'package:provider_shopper/models/product_model.dart';
import 'package:provider_shopper/pages/order/order_page.dart';
import 'package:provider_shopper/service/mock_data.dart';

class HomeProvider extends ChangeNotifier {
  int orderNumber = 0;
  List<Category> categories = [];

  HomeProvider() {
    getAllCategories();
  }

  void onTapBasket({required BuildContext context}) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const OrderPage()));
  }

  void getAllCategories() {
    categories = categoriesMock.map((category) => Category.fromJson(category)).toList();
    final List<Category> items = [];
    for(int i = 0; i < categories.length; i++) {
      final products = productsMock
          .where((product) => product["categoryId"] == categories[i].id)
          .map((product) => Product.fromJson(product)).toList();
      items.add(categories[i].copyWith(products: products));
    }
    categories = items;
  }

  int getGridSize(Category category) {
    if(category.products.length >= 4) {
      return 4;
    } else {
      return category.products.length;
    }
  }
}
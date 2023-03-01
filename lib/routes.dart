import 'package:eco_app/domain/model/large_category_model.dart';
import 'package:eco_app/domain/model/product_model.dart';
import 'package:eco_app/presentation/scenes/category_details/category_details_screen.dart';
import 'package:eco_app/presentation/scenes/product_details/product_details_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  Routes._();

  static const categoryDetails = '/category_details';
  static const productDetails = '/product-details';
}

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  Routes.categoryDetails: (BuildContext context) => CategoryDetailsScreen(
      category:
          ModalRoute.of(context)?.settings.arguments as LargeCategoryModel),
  Routes.productDetails: (BuildContext context) => ProductDetailsScreen(
      product: ModalRoute.of(context)?.settings.arguments as ProductModel),
};

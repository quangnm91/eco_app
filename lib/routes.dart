import 'package:eco_app/domain/model/large_category_model.dart';
import 'package:eco_app/domain/model/product_model.dart';
import 'package:eco_app/presentation/scenes/category_details/category_details_screen.dart';
import 'package:eco_app/presentation/scenes/home/home_screen.dart';
import 'package:eco_app/presentation/scenes/product_details/product_details_screen.dart';
import 'package:eco_app/presentation/scenes/sign_in/sign_in_screen.dart';
import 'package:eco_app/presentation/scenes/sign_up/sign_up_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  Routes._();

  static const categoryDetails = '/category_details';
  static const productDetails = '/product-details';
  static const home = '/home';
  static const signIn = '/sign-in';
  static const signUp = '/sign-up';
}

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  Routes.categoryDetails: (BuildContext context) => CategoryDetailsScreen(
      category:
          ModalRoute.of(context)?.settings.arguments as LargeCategoryModel),
  Routes.productDetails: (BuildContext context) => ProductDetailsScreen(
      product: ModalRoute.of(context)?.settings.arguments as ProductModel),
  Routes.home: (BuildContext context) => const HomeScreen(),
  Routes.signUp: (BuildContext context) => const SignUpScreen(),
  Routes.signIn: (BuildContext context) => const SignInScreen(),
};

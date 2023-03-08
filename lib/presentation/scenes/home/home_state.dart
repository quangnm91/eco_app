// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:eco_app/domain/model/large_category_model.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/model/product_model.dart';

enum HomeStatus { initial, loading, error, done, success }

class HomeState extends Equatable {
  final HomeStatus status;
  final String message;
  final List<ProductModel> products;
  final List<LargeCategoryModel> largeCategories;
  final int lastPage;

  const HomeState._({
    this.status = HomeStatus.initial,
    this.message = '',
    this.products = const [],
    this.largeCategories = const [],
    this.lastPage = 1,
  });

  const HomeState.initial() : this._();

  HomeState copyWith({
    HomeStatus? status,
    String? message,
    List<ProductModel>? products,
    List<LargeCategoryModel>? largeCategories,
    int? lastPage,
  }) =>
      HomeState._(
        status: status ?? this.status,
        message: message ?? this.message,
        products: products ?? this.products,
        largeCategories: largeCategories ?? this.largeCategories,
        lastPage: lastPage ?? this.lastPage,
      );

  @override
  List<Object?> get props =>
      [status, message, largeCategories, products, lastPage];
}

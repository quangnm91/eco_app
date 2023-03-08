part of 'product_details_bloc.dart';

enum ProductDetailsStatus { initial, loading, error, done, success }

class ProductDetailsState extends Equatable {
  final ProductDetailsStatus status;
  final String message;
  final ProductModel? productModel;
  const ProductDetailsState._({
    this.status = ProductDetailsStatus.initial,
    this.message = '',
    this.productModel,
  });

  const ProductDetailsState.initial() : this._();

  ProductDetailsState copyWith({
    ProductDetailsStatus? status,
    String? message,
    ProductModel? productModel,
  }) =>
      ProductDetailsState._(
        status: status ?? this.status,
        message: message ?? this.message,
        productModel: productModel ?? this.productModel,
      );

  @override
  List<Object> get props => [status, message, productModel ?? true];
}

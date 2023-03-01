part of 'product_details_bloc.dart';

enum ProductDetailsStatus { initial, loading, error, done, success }

class ProductDetailsState extends Equatable {
  final ProductDetailsStatus status;
  final String message;
  const ProductDetailsState._({
    this.status = ProductDetailsStatus.initial,
    this.message = '',
  });

  const ProductDetailsState.initial() : this._();

  ProductDetailsState copyWith({
    ProductDetailsStatus? status,
    String? message,
  }) =>
      ProductDetailsState._(
        status: status ?? this.status,
        message: message ?? this.message,
      );

  @override
  List<Object> get props => [];
}

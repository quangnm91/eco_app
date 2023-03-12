part of 'category_details_bloc.dart';

enum CategoryDetailsStatus { initial, loading, error, done }

class CategoryDetailsState extends Equatable {
  final CategoryDetailsStatus status;
  final String message;
  final List<ProductModel> products;
  const CategoryDetailsState._({
    this.status = CategoryDetailsStatus.initial,
    this.message = '',
    this.products = const [],
  });

  const CategoryDetailsState.initial() : this._();
  CategoryDetailsState copyWith({
    CategoryDetailsStatus? status,
    String? message,
    List<ProductModel>? products,
  }) =>
      CategoryDetailsState._(
          status: status ?? this.status,
          message: message ?? this.message,
          products: products ?? this.products);

  @override
  List<Object> get props => [status, message, products];
}

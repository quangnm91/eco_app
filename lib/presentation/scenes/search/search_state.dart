part of 'search_bloc.dart';

enum SearchStatus { initial, loading, error, done, success }

class SearchState extends Equatable {
  final SearchStatus status;
  final String message;
  final List<ProductModel> products;

  const SearchState._({
    this.status = SearchStatus.initial,
    this.message = '',
    this.products = const [],
  });

  const SearchState.initial() : this._();

  SearchState copyWith({
    SearchStatus? status,
    String? message,
    List<ProductModel>? products,
  }) =>
      SearchState._(
        status: status ?? this.status,
        message: message ?? this.message,
        products: products ?? this.products,
      );

  @override
  List<Object> get props => [status, message, products];
}

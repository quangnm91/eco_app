part of 'product_details_bloc.dart';

abstract class ProductDetailsEvent extends Equatable {
  const ProductDetailsEvent();

  @override
  List<Object> get props => [];
}

class InitialEvent extends ProductDetailsEvent {
  const InitialEvent();
}

class LoadingEvent extends ProductDetailsEvent {
  const LoadingEvent();
}

class AddToCartEvent extends ProductDetailsEvent {
  final int productId;
  final int quantity;
  const AddToCartEvent({required this.productId, required this.quantity});
}

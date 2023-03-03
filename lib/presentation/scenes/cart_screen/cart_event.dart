// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class InitialEvent extends CartEvent {
  const InitialEvent();
}

class LoadingEvent extends CartEvent {
  const LoadingEvent();
}

class ChangeCartItemQuantity extends CartEvent {
  final int cartItemId;
  final int quantity;
  const ChangeCartItemQuantity({
    required this.cartItemId,
    required this.quantity,
  });
}

class RemoveFromCart extends CartEvent {
  final int cartItemId;
  const RemoveFromCart({
    required this.cartItemId,
  });
}

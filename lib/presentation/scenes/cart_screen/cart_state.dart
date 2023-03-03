part of 'cart_bloc.dart';

enum CartStatus { initial, loading, error, done, success }

class CartState extends Equatable {
  final CartStatus status;
  final String message;
  final CartModel? cart;

  const CartState._({
    this.status = CartStatus.initial,
    this.message = '',
    this.cart,
  });
  const CartState.initial() : this._();

  CartState copyWith({
    CartStatus? status,
    String? message,
    CartModel? cart,
  }) =>
      CartState._(
        status: status ?? this.status,
        message: message ?? this.message,
        cart: cart ?? this.cart,
      );

  @override
  List<Object> get props => [status, message, cart ?? true];
}

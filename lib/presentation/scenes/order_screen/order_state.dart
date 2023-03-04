part of 'order_bloc.dart';

enum OrderStatus { initial, loading, error, done }

class OrderState extends Equatable {
  final OrderStatus status;
  final String message;
  final List<OrderModel> orders;
  const OrderState._({
    this.status = OrderStatus.initial,
    this.message = '',
    this.orders = const [],
  });
  const OrderState.initial() : this._();

  OrderState copyWith({
    OrderStatus? status,
    String? message,
    List<OrderModel>? orders,
  }) =>
      OrderState._(
        status: status ?? this.status,
        message: message ?? this.message,
        orders: orders ?? this.orders,
      );

  @override
  List<Object> get props => [status, message, orders];
}

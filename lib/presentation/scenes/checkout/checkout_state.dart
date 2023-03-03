part of 'checkout_bloc.dart';

enum CheckoutStatus { initial, loading, error, done, success }

class CheckoutState extends Equatable {
  final CheckoutStatus status;
  final String message;

  const CheckoutState._({
    this.status = CheckoutStatus.initial,
    this.message = '',
  });

  const CheckoutState.initial() : this._();

  CheckoutState copyWith({
    CheckoutStatus? status,
    String? message,
  }) =>
      CheckoutState._(
        status: status ?? this.status,
        message: message ?? this.message,
      );

  @override
  List<Object> get props => [];
}

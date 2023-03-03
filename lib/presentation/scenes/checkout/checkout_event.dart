// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'checkout_bloc.dart';

class CheckoutEvent extends Equatable {
  const CheckoutEvent();

  @override
  List<Object> get props => [];
}

class InitialEvent extends CheckoutEvent {
  const InitialEvent();
}

class LoadingEvent extends CheckoutEvent {
  const LoadingEvent();
}

class ConfirmOrderEvent extends CheckoutEvent {
  final int userAddressId;
  final int shoppingSessionId;
  const ConfirmOrderEvent({
    required this.userAddressId,
    required this.shoppingSessionId,
  });
}

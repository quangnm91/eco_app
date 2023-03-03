import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/usecases/order_usecases.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc({required this.orderUsecases})
      : super(const CheckoutState.initial()) {
    on<InitialEvent>(onInitialEvent);
    on<LoadingEvent>(onLoadingEvent);
    on<ConfirmOrderEvent>(onConfirmOrderEvent);
  }

  final OrderUsecases orderUsecases;

  FutureOr<void> onInitialEvent(
      InitialEvent event, Emitter<CheckoutState> emit) {}

  FutureOr<void> onLoadingEvent(
      LoadingEvent event, Emitter<CheckoutState> emit) {}

  FutureOr<void> onConfirmOrderEvent(
      ConfirmOrderEvent event, Emitter<CheckoutState> emit) async {
    final result = await orderUsecases.store(
        userAddressId: event.userAddressId,
        shoppingSessionId: event.shoppingSessionId);

    result.fold(
        (failure) => emit(state.copyWith(
            status: CheckoutStatus.error, message: failure.message)),
        (response) => emit(state.copyWith(
            status: CheckoutStatus.success,
            message: 'Order products succesfully')));
  }
}

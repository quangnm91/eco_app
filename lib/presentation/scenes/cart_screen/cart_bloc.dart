import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/model/cart_model.dart';
import '../../../domain/usecases/cart_usecases.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc({required this.cartUsecases}) : super(const CartState.initial()) {
    on<InitialEvent>(onInitialEvent);
    on<LoadingEvent>(onLoadingEvent);
    on<ChangeCartItemQuantity>(onChangeQuantityEvent);
    on<RemoveFromCart>(onRemoveFromCartEvent);
  }

  final CartUsecases cartUsecases;

  FutureOr<void> onInitialEvent(InitialEvent event, Emitter<CartState> emit) {
    emit(state.copyWith(status: CartStatus.loading));
  }

  FutureOr<void> onLoadingEvent(
      LoadingEvent event, Emitter<CartState> emit) async {
    final result = await cartUsecases.get();
    result.fold(
        (failure) => emit(
            state.copyWith(status: CartStatus.error, message: failure.message)),
        (response) {
      emit(state.copyWith(status: CartStatus.done, cart: response.data));
    });
  }

  FutureOr<void> onChangeQuantityEvent(
      ChangeCartItemQuantity event, Emitter<CartState> emit) async {
    final result = await cartUsecases.update(
        cartItemId: event.cartItemId, quantity: event.quantity);
    result.fold(
        (failure) => emit(
            state.copyWith(status: CartStatus.error, message: failure.message)),
        (response) => emit(state.copyWith(
            status: CartStatus.success,
            cart: response.data,
            message: 'Change product quantity')));
  }

  FutureOr<void> onRemoveFromCartEvent(
      RemoveFromCart event, Emitter<CartState> emit) async {
    final result = await cartUsecases.delete(cartItemId: event.cartItemId);
    result.fold(
        (failure) => emit(
            state.copyWith(status: CartStatus.error, message: failure.message)),
        (response) => emit(state.copyWith(
            status: CartStatus.success,
            cart: response.data,
            message: 'Removed product from cart')));
  }
}

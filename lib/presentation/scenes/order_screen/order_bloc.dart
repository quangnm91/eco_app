// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/model/order_model.dart';
import '../../../domain/usecases/order_usecases.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc({required this.orderUsecases}) : super(const OrderState.initial()) {
    on<InitialEvent>(onInitialEvent);
    on<LoadingEvent>(onLoadingEvent);
  }

  final OrderUsecases orderUsecases;

  FutureOr<void> onInitialEvent(
      InitialEvent event, Emitter<OrderState> emit) async {
    final result = await orderUsecases.get();
    result.fold(
        (failure) => emit(state.copyWith(
            status: OrderStatus.error, message: failure.message)),
        (response) => emit(
            state.copyWith(status: OrderStatus.done, orders: response.data)));
  }

  FutureOr<void> onLoadingEvent(LoadingEvent event, Emitter<OrderState> emit) {}
}

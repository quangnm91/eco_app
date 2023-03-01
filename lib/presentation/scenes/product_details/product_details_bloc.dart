import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eco_app/domain/usecases/cart_usecases.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

part 'product_details_event.dart';
part 'product_details_state.dart';

class ProductDetailsBloc
    extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  ProductDetailsBloc({required this.cartUsecases})
      : super(const ProductDetailsState.initial()) {
    on<InitialEvent>(onInitialEvent);
    on<LoadingEvent>(onLoadingEvent);
    on<AddToCartEvent>(onAddToCartEvent);
  }
  final CartUsecases cartUsecases;
  final rxQuantity = ReplaySubject<int>();

  FutureOr<void> onInitialEvent(
      InitialEvent event, Emitter<ProductDetailsState> emit) {}

  FutureOr<void> onLoadingEvent(
      LoadingEvent event, Emitter<ProductDetailsState> emit) {}

  @override
  Future<void> close() {
    rxQuantity.close();
    return super.close();
  }

  FutureOr<void> onAddToCartEvent(
      AddToCartEvent event, Emitter<ProductDetailsState> emit) async {
    final result = await cartUsecases.add(event.productId, event.quantity);
    result.fold(
        (failure) => emit(state.copyWith(
            status: ProductDetailsStatus.error, message: failure.message)),
        (response) =>
            emit(state.copyWith(status: ProductDetailsStatus.success)));
  }
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eco_app/domain/usecases/cart_usecases.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

import '../../../data/local/authenticated_cache.dart';
import '../../../domain/model/product_model.dart';
import '../../../domain/usecases/product_usecases.dart';

part 'product_details_event.dart';
part 'product_details_state.dart';

class ProductDetailsBloc
    extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  ProductDetailsBloc(
      {required this.cartUsecases,
      required this.authenticatedCache,
      required this.productUsecases})
      : super(const ProductDetailsState.initial()) {
    on<InitialEvent>(onInitialEvent);
    on<LoadingEvent>(onLoadingEvent);
    on<AddToCartEvent>(onAddToCartEvent);
  }
  final CartUsecases cartUsecases;
  final AuthenticatedCache authenticatedCache;
  final ProductUsecases productUsecases;
  final rxQuantity = ReplaySubject<int>();

  FutureOr<void> onInitialEvent(
      InitialEvent event, Emitter<ProductDetailsState> emit) async {
    // fetch product by id ?
    emit(state.copyWith(status: ProductDetailsStatus.loading));
    final result = await productUsecases.getProductById(event.productId);
    result.fold(
        (failure) => emit(state.copyWith(
            status: ProductDetailsStatus.error, message: failure.message)),
        (response) => emit(state.copyWith(
            status: ProductDetailsStatus.done, productModel: response.data)));
  }

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

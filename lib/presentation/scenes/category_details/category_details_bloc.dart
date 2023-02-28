import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/model/product_model.dart';
import '../../../domain/usecases/product_usecases.dart';

part 'category_details_event.dart';
part 'category_details_state.dart';

class CategoryDetailsBloc
    extends Bloc<CategoryDetailsEvent, CategoryDetailsState> {
  final ProductUsecases productUsecases;
  CategoryDetailsBloc({required this.productUsecases})
      : super(const CategoryDetailsState.initial()) {
    on<InitialEvent>(onInitialEvent);
    on<LoadingEvent>(onLoadingEvent);
  }

  FutureOr<void> onInitialEvent(
      InitialEvent event, Emitter<CategoryDetailsState> emit) {}

  FutureOr<void> onLoadingEvent(
      LoadingEvent event, Emitter<CategoryDetailsState> emit) async {
    final products = await productUsecases.getProducts(
        queryParameters: {"large_category_id": event.largeCategoryId});
    products.fold(
        (failure) => emit(state.copyWith(
            status: CategoryDetailsStatus.error, message: failure.message)),
        (response) => emit(state.copyWith(
            status: CategoryDetailsStatus.done, products: response.data)));
  }
}

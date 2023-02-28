import 'dart:async';

import 'package:eco_app/domain/usecases/category_usecases.dart';
import 'package:eco_app/domain/usecases/product_usecases.dart';
import 'package:eco_app/presentation/scenes/home/home_event.dart';
import 'package:eco_app/presentation/scenes/home/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ProductUsecases productUsecases;
  final CategoryUsecases categoryUsecases;
  HomeBloc({required this.productUsecases, required this.categoryUsecases})
      : super(const HomeState.initial()) {
    on<InitialEvent>(onInitialEvent);
    on<LoadingEvent>(onLoadingEvent);
  }

  FutureOr<void> onInitialEvent(
      InitialEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(status: HomeStatus.loading));
  }

  FutureOr<void> onLoadingEvent(
      LoadingEvent event, Emitter<HomeState> emit) async {
    final categories = await categoryUsecases.getLargeCategories();
    categories.fold(
        (failure) => emit(
            state.copyWith(status: HomeStatus.error, message: failure.message)),
        (response) => emit(state.copyWith(
            status: HomeStatus.done, largeCategories: response.data)));

    final result = await productUsecases.getProducts();
    result.fold((failure) {
      emit(state.copyWith(status: HomeStatus.error, message: failure.message));
    }, (response) {
      emit(state.copyWith(status: HomeStatus.done, products: response.data));
    });
  }
}

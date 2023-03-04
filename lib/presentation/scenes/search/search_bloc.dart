import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eco_app/domain/usecases/product_usecases.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/model/product_model.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc({required this.productUsecases})
      : super(const SearchState.initial()) {
    on<InitialEvent>(onInititalEvent);
    on<LoadingEvent>(onLoadingEvent);
    on<SubmitEvent>(onSubmitEvent);
  }
  final ProductUsecases productUsecases;

  FutureOr<void> onInititalEvent(
      InitialEvent event, Emitter<SearchState> emit) {}

  FutureOr<void> onLoadingEvent(
      LoadingEvent event, Emitter<SearchState> emit) {}

  FutureOr<void> onSubmitEvent(
      SubmitEvent event, Emitter<SearchState> emit) async {
    final result = await productUsecases
        .getProducts(queryParameters: {'keyword': event.keyword});
    result.fold(
        (failure) => emit(state.copyWith(
            status: SearchStatus.error, message: failure.message)),
        (response) => emit(state.copyWith(
            status: SearchStatus.success, products: response.data)));
  }
}

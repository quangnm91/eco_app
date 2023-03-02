import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

import '../../../data/local/authenticated_cache.dart';
import '../../../domain/usecases/auth_usecase.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc({required this.authUsecases, required this.authenticatedCache})
      : super(const SignInState.initial()) {
    on<InitialEvent>(onInititalEvent);
    on<LoadingEvent>(onLoadingEvent);
    on<ClickSignInButtonEvent>(onClickSignInButtonEvent);
  }
  final AuthUsecases authUsecases;
  final AuthenticatedCache authenticatedCache;
  final rxEmail = ReplaySubject<String>();
  final rxPassword = ReplaySubject<String>();

  FutureOr<void> onInititalEvent(
      InitialEvent event, Emitter<SignInState> emit) {}

  FutureOr<void> onLoadingEvent(
      LoadingEvent event, Emitter<SignInState> emit) {}

  FutureOr<void> onClickSignInButtonEvent(
      ClickSignInButtonEvent event, Emitter<SignInState> emit) async {
    final result = await authUsecases.signIn(event.email, event.password);

    result.fold(
        (failure) => emit(state.copyWith(
            status: SignInStatus.error,
            message: failure.message)), (response) async {
      authenticatedCache.putToken(token: response.data);
      emit(state.copyWith(status: SignInStatus.success));
    });
  }
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

import '../../../domain/usecases/auth_usecase.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc({required this.authUsecases})
      : super(const SignUpState.initial()) {
    on<InitialEvent>(onInititalEvent);
    on<LoadingEvent>(onLoadingEvent);
    on<ClickSignUpButtonEvent>(onClickSignUpButtonEvent);
  }
  final AuthUsecases authUsecases;
  final rxEmail = ReplaySubject<String>();
  final rxPassword = ReplaySubject<String>();

  Stream<bool> get isRegistable => Rx.combineLatest2<String?, String?, bool>(
          rxEmail.stream, rxPassword.stream, (email, password) {
        return email != null && password != null;
      });

  FutureOr<void> onInititalEvent(
      InitialEvent event, Emitter<SignUpState> emit) {}

  FutureOr<void> onLoadingEvent(
      LoadingEvent event, Emitter<SignUpState> emit) {}

  FutureOr<void> onClickSignUpButtonEvent(
      ClickSignUpButtonEvent event, Emitter<SignUpState> emit) async {
    final result = await authUsecases.signUp(event.email, event.password);

    result.fold(
        (failure) => emit(state.copyWith(
            status: SignUpStatus.error, message: failure.message)),
        (response) => emit(state.copyWith(status: SignUpStatus.success)));
  }
}

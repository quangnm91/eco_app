part of 'sign_in_bloc.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class InitialEvent extends SignInEvent {
  const InitialEvent();
}

class LoadingEvent extends SignInEvent {
  const LoadingEvent();
}

class ClickSignInButtonEvent extends SignInEvent {
  final String email;
  final String password;
  const ClickSignInButtonEvent(this.email, this.password);
}

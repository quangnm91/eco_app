part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class InitialEvent extends SignUpEvent {
  const InitialEvent();
}

class LoadingEvent extends SignUpEvent {
  const LoadingEvent();
}

class ClickSignUpButtonEvent extends SignUpEvent {
  final String email;
  final String password;
  const ClickSignUpButtonEvent(this.email, this.password);
}

part of 'sign_in_bloc.dart';

enum SignInStatus { initial, loading, error, done, success }

class SignInState extends Equatable {
  const SignInState._({
    this.status = SignInStatus.initial,
    this.message = '',
  });

  const SignInState.initial() : this._();

  final SignInStatus status;
  final String message;

  SignInState copyWith({
    SignInStatus? status,
    String? message,
  }) =>
      SignInState._(
        status: status ?? this.status,
        message: message ?? this.message,
      );

  @override
  List<Object> get props => [status, message];
}

part of 'sign_up_bloc.dart';

enum SignUpStatus { initial, loading, error, done, success }

class SignUpState extends Equatable {
  final SignUpStatus status;
  final String message;

  const SignUpState._({
    this.status = SignUpStatus.initial,
    this.message = '',
  });

  const SignUpState.initial() : this._();

  SignUpState copyWith({
    SignUpStatus? status,
    String? message,
  }) =>
      SignUpState._(
        status: status ?? this.status,
        message: message ?? this.message,
      );

  @override
  List<Object> get props => [status, message];
}

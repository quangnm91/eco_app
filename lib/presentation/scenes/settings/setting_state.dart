part of 'setting_bloc.dart';

enum SettingStatus { initial, loading, error, done, logout }

class SettingState extends Equatable {
  final SettingStatus status;
  final String message;

  const SettingState._({
    this.status = SettingStatus.initial,
    this.message = '',
  });

  const SettingState.initial() : this._();

  SettingState copyWith({
    SettingStatus? status,
    String? message,
  }) =>
      SettingState._(
        status: status ?? this.status,
        message: message ?? this.message,
      );

  @override
  List<Object> get props => [];
}

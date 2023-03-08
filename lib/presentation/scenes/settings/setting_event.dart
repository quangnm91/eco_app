part of 'setting_bloc.dart';

abstract class SettingEvent extends Equatable {
  const SettingEvent();

  @override
  List<Object> get props => [];
}

class InitialEvent extends SettingEvent {
  const InitialEvent();
}

class LogoutEvent extends SettingEvent {
  const LogoutEvent();
}

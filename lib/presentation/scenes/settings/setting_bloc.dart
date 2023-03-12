// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eco_app/data/local/authenticated_cache.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/usecases/auth_usecases.dart';

part 'setting_event.dart';
part 'setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc({
    required this.authUsecases,
    required this.authenticatedCache,
  }) : super(const SettingState.initial()) {
    on<InitialEvent>(onInitialEvent);
    on<LogoutEvent>(onLogoutEvent);
  }
  final AuthUsecases authUsecases;
  final AuthenticatedCache authenticatedCache;
  FutureOr<void> onInitialEvent(
      InitialEvent event, Emitter<SettingState> emit) {}

  FutureOr<void> onLogoutEvent(
      LogoutEvent event, Emitter<SettingState> emit) async {
    emit(state.copyWith(status: SettingStatus.loading));
    final result = await authUsecases.logout();
    result.fold(
        (failure) => emit(state.copyWith(
            status: SettingStatus.error, message: failure.message)),
        (response) => emit(state.copyWith(
            status: SettingStatus.logout, message: 'Logout successfully')));
  }
}

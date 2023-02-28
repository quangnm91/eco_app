import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class InitialEvent extends HomeEvent {
  const InitialEvent();
}

class LoadingEvent extends HomeEvent {
  const LoadingEvent();
}

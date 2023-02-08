import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class InitialEvent extends HomeEvent {
  const InitialEvent();
}

class ChangeSliderPage extends HomeEvent {
  final int newPageIndex;
  const ChangeSliderPage({required this.newPageIndex});
}

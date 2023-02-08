import 'package:equatable/equatable.dart';

enum HomeStatus { initial, loading, error, done, success }

class HomeState extends Equatable {
  final HomeStatus status;
  const HomeState.construct({this.status = HomeStatus.initial});

  const HomeState.initial() : this.construct();

  HomeState copyWith({
    HomeStatus? status,
  }) =>
      HomeState.construct(status: status ?? this.status);

  @override
  List<Object?> get props => [status];
}

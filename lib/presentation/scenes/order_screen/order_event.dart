part of 'order_bloc.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object> get props => [];
}

class InitialEvent extends OrderEvent {
  const InitialEvent();
}

class LoadingEvent extends OrderEvent {
  const LoadingEvent();
}

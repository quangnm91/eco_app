import 'package:eco_app/presentation/scenes/home/home_event.dart';
import 'package:eco_app/presentation/scenes/home/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState.initial()) {
    on<ChangeSliderPage>(onChangedSliderPage);
  }

  void onChangedSliderPage(
      ChangeSliderPage event, Emitter<HomeState> emitter) async {
    //     emitter()
    //      emitter(const OrderLoadingState());
    //        if (_demoOrders.length >= 0) {
    //   emitter(OrderSuccessFetchDataState(orders: _demoOrders));
    // } else {
    //   emitter(const OrderErrorFetchDataState(
    //       errorMessage: "Something went wrong please try again!"));
    // }
  }
}

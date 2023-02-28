import 'package:eco_app/core/utils/log_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  /// {@macro app_bloc_observer}
  const AppBlocObserver();

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    LogHelper().logger.d(
        '----from: ${change.currentState}\n to: ${change.nextState}\n callstack: ${StackTrace.current}\n-----------\n');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}

import 'package:bloc/bloc.dart';

class CounterObserver extends BlocObserver {
  const CounterObserver();

  // Override the onChange method to see all state changes tha occur
  // onChange works the same way for both Bloc and Cubit
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    // ignore: avoid_print
    print('${bloc.runtimeType} $change');
  }
}

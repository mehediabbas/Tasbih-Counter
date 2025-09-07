import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() {
    if (state + 1 >= 1000) {
      emit(0);
    } else {
      emit(state + 1);
    }
  }

  void decrement() {
    if (state > 0) {
      emit(state - 1);
    } else {
      emit(0);
    }
  }

  void reset() => emit(0);
}

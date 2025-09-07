import 'package:fa1_tasbeeh/bloc/counter_event.dart';
import 'package:fa1_tasbeeh/bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(counterValue: 0)) {
    on<Increment>((event, emit) {
      int newValue = state.counterValue + 1;
      if (newValue >= 1000) {
        newValue = 0;
      }
      emit(CounterState(counterValue: newValue));
    });

    on<Decrement>((event, emit) {
      int newValue = state.counterValue - 1;
      if (newValue < 0) {
        newValue = 0;
      }
      emit(CounterState(counterValue: newValue));
    });

    on<Reset>((event, emit) {
      emit(CounterState(counterValue: 0));
    });
  }
}
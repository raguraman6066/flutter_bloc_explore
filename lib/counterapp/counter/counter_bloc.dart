import 'package:blocexplore/counterapp/counter/counter_event.dart';
import 'package:blocexplore/counterapp/counter/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(InitialCounterState()) {
    on<IncrementCounterEvent>((event, emit) {
      emit(IncreasedCounterState());
    });
    on<DecrementCounterEvent>((event, emit) {
      emit(DecreasedCounterState());
    });
  }
}

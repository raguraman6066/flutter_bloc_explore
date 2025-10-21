// sealed class CounterState {}

// final class InitialCounterState extends CounterState {}
// final class IncreasedCounterState extends CounterState {}
// final class DecreasedCounterState extends CounterState {}
class CounterState {
  final int counterValue;
  CounterState({required this.counterValue});
}

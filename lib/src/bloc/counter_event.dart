enum CounterType {increment, decrement}
 class CounterEvent{
  final CounterType type;
  CounterEvent(this.type);
}

// class IncrementEvent extends CounterEvent{
//
// }
//
// class DecrementEvent extends CounterEvent{
//
// }
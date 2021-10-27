 import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/bloc/counter_event.dart';
import 'package:news_app/src/bloc/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState>{
  CounterBloc(CounterState initialState) : super(initialState);

@override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
  if(event.type == CounterType.increment){
    yield state.copy(state.count+1);

  }else if(event.type== CounterType.decrement){
    yield state.copy(state.count-1);
  }
}

}




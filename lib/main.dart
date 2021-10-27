



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/bloc/counter_bloc.dart';
import 'package:news_app/src/bloc/counter_event.dart';
import 'package:news_app/src/bloc/counter_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {


  void _incrementCounter(BuildContext context) {
// add IncrementEvent to the bloc
   final bloc = BlocProvider.of<CounterBloc>(context);
  bloc.add(CounterEvent(CounterType.increment));
  }

  void _decrementCounter(BuildContext context) {
    final bloc = BlocProvider.of<CounterBloc>(context);
    bloc.add(CounterEvent(CounterType.decrement));
    // add DecrementEvent to the bloc

  }

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create:(context) => CounterBloc(CounterState(0)),
      child: Builder(builder:(context){
          return Scaffold(
            appBar: AppBar(
              title: Text("Counter Bloc"),
            ),
           body: Center(

              child: BlocBuilder<CounterBloc,CounterState>(
                builder: (context, CounterState state) {
                  return Column(

                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'You have pushed the button this many times:',
                      ),
                      Text(
                        '',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ],
                  );
                }
              ),
            ),
            floatingActionButton: Column(
              mainAxisSize:  MainAxisSize.min,
              children: [
                FloatingActionButton(
                  onPressed:() =>_incrementCounter(context),
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                ),
                SizedBox(height: 8),
                FloatingActionButton(
                  onPressed: () =>
                    _decrementCounter(context),
                  tooltip: 'Decrement',
                  child: Icon(Icons.remove),
                ),
              ],
            ), // This trailing comma makes auto-formatting nicer for build methods.
          );
        }
      ),
    );
  }
}

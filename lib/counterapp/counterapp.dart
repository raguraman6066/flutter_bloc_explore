import 'package:blocexplore/counterapp/counter/counter_bloc.dart';
import 'package:blocexplore/counterapp/counter/counter_event.dart';
import 'package:blocexplore/counterapp/counter/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    int count = 0;
    return Scaffold(
      appBar: AppBar(title: Text("Counter App")),
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          if (state is IncreasedCounterState) {
            return Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("${++count}"),
                  ElevatedButton(
                    onPressed: () {
                      context.read<CounterBloc>().add(IncrementCounterEvent());
                    },
                    child: Text("+"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<CounterBloc>().add(DecrementCounterEvent());
                    },
                    child: Text("-"),
                  ),
                ],
              ),
            );
          } else if (state is InitialCounterState) {
            return Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("${count}"),
                  ElevatedButton(
                    onPressed: () {
                      context.read<CounterBloc>().add(IncrementCounterEvent());
                    },
                    child: Text("+"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<CounterBloc>().add(DecrementCounterEvent());
                    },
                    child: Text("-"),
                  ),
                ],
              ),
            );
          } else {
            return Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("${--count}"),
                  ElevatedButton(
                    onPressed: () {
                      context.read<CounterBloc>().add(IncrementCounterEvent());
                    },
                    child: Text("+"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<CounterBloc>().add(DecrementCounterEvent());
                    },
                    child: Text("-"),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

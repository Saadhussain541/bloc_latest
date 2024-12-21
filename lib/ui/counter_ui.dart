import 'package:bloc1/bloc/counter_bloc/counter_bloc.dart';
import 'package:bloc1/bloc/counter_bloc/counter_event.dart';
import 'package:bloc1/bloc/counter_bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class CounterUi extends StatefulWidget {
  const CounterUi({super.key});

  @override
  State<CounterUi> createState() => _CounterUiState();
}

class _CounterUiState extends State<CounterUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterBloc,CounterState>(builder: (context, state) {
              return Text(state.counter.toString(),style: TextStyle(color: Colors.deepOrange,fontSize: 25),);
            },),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: (){
                  context.read<CounterBloc>().add(IncrementCounter());
                }, child: Text('Add')),
                SizedBox(width: 20,),
                ElevatedButton(onPressed: (){
                  context.read<CounterBloc>().add(DecrementCounter());
                }, child: Text('Remove')),

              ],
            )
          ],
        ),
      ),
    );
  }
}

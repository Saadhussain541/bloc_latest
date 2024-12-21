import 'package:bloc1/bloc/switchExample/switch_bloc.dart';
import 'package:bloc1/bloc/switchExample/switch_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/switchExample/switch_state.dart';
class SwitchUi extends StatefulWidget {
  const SwitchUi({super.key});

  @override
  State<SwitchUi> createState() => _SwitchUiState();
}

class _SwitchUiState extends State<SwitchUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Switch Example'),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Notification'),
                BlocBuilder<SwitchBloc,SwiteState>(
                  buildWhen: (previous,current)=>previous.isSwitch!=current.isSwitch,
                  builder: (context, state) {
                  return Switch(value: state.isSwitch, onChanged: (value){
                    context.read<SwitchBloc>().add(EnableOrDisableNotification());
                  });
                },)
              ],
            ),
            const SizedBox(height: 30,),
            BlocBuilder<SwitchBloc,SwiteState>(
              buildWhen: (previous,current)=>previous.slider!=current.slider,
              builder: (context, state) {
              return Container(
                width: double.infinity,
                height: 200,
                color: Colors.red.withOpacity(state.slider),
              );
            },),
            const SizedBox(height: 30,),
            BlocBuilder<SwitchBloc,SwiteState>(
              buildWhen: (previous,current)=>previous.slider!=current.slider,
              builder:  (context, state) {
              return Slider(value: state.slider, onChanged: (value){
                context.read<SwitchBloc>().add( SliderEvent(slider: value));
              });
            },)
          ],
        ),
      ),
    );
  }
}

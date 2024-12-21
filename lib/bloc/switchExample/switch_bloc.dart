import 'package:bloc/bloc.dart';
import 'package:bloc1/bloc/switchExample/switch_event.dart';
import 'package:bloc1/bloc/switchExample/switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent,SwiteState>
{

  SwitchBloc():super(SwiteState()){
    on<EnableOrDisableNotification> (_enableOrDisableNotification);
    on<SliderEvent> (_sliderValue);
  }

  void _enableOrDisableNotification(EnableOrDisableNotification event,Emitter<SwiteState> emit)
  {
    emit(state.copyWith(isSwitch:!state.isSwitch));
  }

  void _sliderValue(SliderEvent event,Emitter<SwiteState> emit)
  {
    emit(state.copyWith(slider: event.slider));
  }



}
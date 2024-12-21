import 'package:equatable/equatable.dart';

class SwiteState extends Equatable
{
   bool isSwitch;
   double slider;

   SwiteState({this.isSwitch=false,this.slider=0.1});
   SwiteState copyWith({bool? isSwitch,double? slider}){
     return SwiteState(isSwitch: isSwitch??this.isSwitch,slider: slider??this.slider);
   }


  @override
  List<Object> get props=>[isSwitch,slider];
}

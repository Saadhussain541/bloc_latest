import 'package:equatable/equatable.dart';

abstract class TodoEvent extends Equatable
{
  const TodoEvent();
  @override
  List<Object> get props=>[];
}

class AddTodoEvent extends TodoEvent
{
  final String todo;
  AddTodoEvent({required this.todo});
  @override
  List<Object> get props=>[];
}


class RemoveTodoEvent extends TodoEvent
{
  final Object task;
  const RemoveTodoEvent({required this.task});
  @override
  List<Object> get props=>[];
}
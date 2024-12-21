import 'package:bloc1/bloc/todo_bloc/todo_bloc.dart';
import 'package:bloc1/bloc/todo_bloc/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/todo_bloc/todo_event.dart';
class TodoUi extends StatefulWidget {
  const TodoUi({super.key});

  @override
  State<TodoUi> createState() => _TodoUiState();
}

class _TodoUiState extends State<TodoUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        for(int i=0;i<10;i++)
          {
            context.read<TodoBloc>().add(AddTodoEvent(todo: 'Todo Task $i'));
          }
        
      },
      child: Icon(Icons.add),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Todo List'),
      ),
      body: BlocBuilder<TodoBloc,TodoState>(builder: (context, state) {
        if(state.todoList.isEmpty)
          {
            return const Center(
              child: Text('No data found'),
            );
          }
        else if(state.todoList.isNotEmpty) {
          return ListView.builder(
            itemCount: state.todoList.length,
            itemBuilder: (context, index) {
            return ListTile(title: Text('$index'),
              trailing: IconButton(
                  onPressed: () {
                    context.read<TodoBloc>().add(RemoveTodoEvent(task: state.todoList[index]));
                  }, icon: const Icon(Icons.delete)),);
          },);
        }
        else
          {
            return SizedBox();
          }
      },),
    );
  }
}

import 'package:bloc1/bloc/get_api_bloc/get_api_bloc.dart';
import 'package:bloc1/bloc/get_api_bloc/get_api_event.dart';
import 'package:bloc1/bloc/get_api_bloc/get_api_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostApiUi extends StatefulWidget {
  const PostApiUi({super.key});

  @override
  _PostApiUiState createState() => _PostApiUiState();
}

class _PostApiUiState extends State<PostApiUi> {
  @override
  void initState() {
    super.initState();
    // Dispatch the FetchPost event when the widget is initialized
    context.read<PostBloc>().add(FetchPost());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Api With Bloc'),
        centerTitle: true,
      ),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          switch (state.postStatus) {
            case PostStatus.initial:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case PostStatus.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case PostStatus.loaded:
              return ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: (context, index) {
                  final post = state.posts[index];
                  return Card(
                    child: ListTile(
                      title: Text(post.title),
                      subtitle: Text(post.body),
                    ),
                  );
                },
              );
            case PostStatus.error:
              return Center(
                child: Text(state.errorMessage ?? 'An error occurred'),
              );
            default:
              return const SizedBox(); // Handle any unforeseen states
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Optional: Allow users to refresh the posts manually
          context.read<PostBloc>().add(FetchPost());
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

import 'package:bloc/bloc.dart';
import 'package:bloc1/bloc/get_api_bloc/get_api_event.dart';
import 'package:bloc1/bloc/get_api_bloc/get_api_state.dart';
import 'package:bloc1/reposity/get_api_reposity.dart';

class PostBloc extends Bloc<PostEvent,PostState>
{
  final PostReposity postReposity;
  PostBloc(this.postReposity):super(const PostState()){
    on<FetchPost>((event,emit) async{
      emit(state.copyWith(postStatus: PostStatus.initial));
      try
          {
            final posts=await postReposity.fetchPosts();
            emit(state.copyWith(posts: posts,postStatus: PostStatus.loaded));
          }
        catch(e)
      {
        emit(state.copyWith(postStatus: PostStatus.error,errorMessage: e.toString()));
      }

    });
  }


}

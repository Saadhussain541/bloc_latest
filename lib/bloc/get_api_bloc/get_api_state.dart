import 'package:equatable/equatable.dart';

import '../../model/get_api_model.dart';

enum PostStatus{initial,loading,loaded,error}
class PostState extends Equatable
{

  final List<Post> posts;
  final PostStatus postStatus;
  final String? errorMessage;

  const PostState({this.postStatus=PostStatus.initial,this.posts=const[],this.errorMessage});

  PostState copyWith({List<Post>? posts,PostStatus? postStatus,String? errorMessage})
  {
    return PostState(posts: posts??this.posts,errorMessage: errorMessage??this.errorMessage,postStatus: postStatus??this.postStatus);
  }


  @override
  List<Object?> get props=>[postStatus,errorMessage,posts];
}
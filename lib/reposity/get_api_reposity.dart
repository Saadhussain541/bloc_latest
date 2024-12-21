import 'dart:convert';

import '../model/get_api_model.dart';
import 'package:http/http.dart' as http;
class PostReposity
{
  Future<List<Post>> fetchPosts() async
  {
    final response=await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if(response.statusCode==200)
      {
        List jsonList=jsonDecode(response.body) as List;
        return jsonList.map((json)=>Post.fromJson(json)).toList();
      }
    else
      {
        throw Exception('Failed to load posts');
      }

  }

}
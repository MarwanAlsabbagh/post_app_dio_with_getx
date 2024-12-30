import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../models/post_model.dart';
import '../services/api_service.dart';

class PostsRepository extends GetxService{
  final ApiService apiService = Get.find<ApiService>();

Future<List<Post>> getPosts() async {
    final response = await apiService.get('/posts');
    return (response.data as List).map((json) => Post.fromJson(json)).toList();
  }

  Future<Post> addPost(Post post) async {
    final response = await apiService.post('/posts', data: post.toJson());
    return Post.fromJson(response.data);
  }

  Future<Post> updatePost(int id, Post post) async {
    final response = await apiService.put('/posts/$id', data: post.toJson());
    return Post.fromJson(response.data);
  }

  Future<void> deletePost(int id) async {
    await apiService.delete('/posts/$id');
  }
}

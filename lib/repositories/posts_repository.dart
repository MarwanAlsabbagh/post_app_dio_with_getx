import '../services/api_service.dart';

class PostsRepository {
  final ApiService apiService;

  PostsRepository(this.apiService);

  Future<List<dynamic>> getPosts() async {
    final response = await apiService.get('/posts');
    return response.data;
  }

  Future<dynamic> addPost(Map<String, dynamic> data) async {
    final response = await apiService.post('/posts', data: data);
    return response.data;
  }

  Future<dynamic> updatePost(int id, Map<String, dynamic> data) async {
    final response = await apiService.put('/posts/$id', data: data);
    return response.data;
  }

  Future<void> deletePost(int id) async {
    await apiService.delete('/posts/$id');
  }
}

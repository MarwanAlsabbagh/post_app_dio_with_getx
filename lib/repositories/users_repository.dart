import '../services/api_service.dart';

class UsersRepository {
  final ApiService apiService;

  UsersRepository(this.apiService);

  Future<List<dynamic>> getUsers() async {
    final response = await apiService.get('/users');
    return response.data;
  }
}
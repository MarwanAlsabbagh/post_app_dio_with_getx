import '../services/api_service.dart';

class TodosRepository {
  final ApiService apiService;

  TodosRepository(this.apiService);

  Future<List<dynamic>> getTodos() async {
    final response = await apiService.get('/todos');
    return response.data;
  }
}
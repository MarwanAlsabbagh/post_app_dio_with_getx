import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../models/todos_model.dart';
import '../services/api_service.dart';

class TodosRepository extends GetxService{
  final ApiService apiService = Get.find<ApiService>();


  Future<List<Todo>> getTodos() async {
    final response = await apiService.get('/todos');
    return (response.data as List).map((json) => Todo.fromJson(json)).toList();
  }
}

import 'package:get/get.dart';
import '../models/todos_model.dart';
import '../repositories/todos_repository.dart';

class TodosController extends GetxController {

  TodosRepository todosRepository= Get.find<TodosRepository>();
  final todos = <Todo>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchTodos();
  }

  Future<void> fetchTodos() async {
    try {
      final data = await todosRepository.getTodos();
      todos.value = data;
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}

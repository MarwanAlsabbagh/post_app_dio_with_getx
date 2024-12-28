import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../repositories/todos_repository.dart';

class TodosController extends GetxController {
  final TodosRepository todosRepository;

  TodosController(this.todosRepository);

  final todos = <dynamic>[].obs;

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
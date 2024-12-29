import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../controllers/todos_controller.dart';
import '../repositories/todos_repository.dart';
import '../services/api_service.dart';

class TodosBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TodosController());

  }
}
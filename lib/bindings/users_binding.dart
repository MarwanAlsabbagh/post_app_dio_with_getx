import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../controllers/users_controller.dart';
import '../repositories/users_repository.dart';
import '../services/api_service.dart';

class UsersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UsersRepository(Get.find<ApiService>()),fenix: true);
    Get.lazyPut(() => UsersController(Get.find<UsersRepository>()),fenix: true);
  }
}
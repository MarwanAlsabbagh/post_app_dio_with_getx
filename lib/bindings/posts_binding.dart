import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../controllers/posts_controller.dart';
import '../repositories/posts_repository.dart';
import '../services/api_service.dart';

class PostsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PostsRepository());
    Get.put(PostsController());

  }
}

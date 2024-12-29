import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../controllers/photos_controller.dart';
import '../repositories/photos_repository.dart';
import '../services/api_service.dart';

class PhotosBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PhotosController());
  }
}
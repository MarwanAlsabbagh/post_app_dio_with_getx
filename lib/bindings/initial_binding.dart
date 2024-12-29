import 'package:get/get.dart';
import '../repositories/photos_repository.dart';
import '../repositories/posts_repository.dart';
import '../repositories/todos_repository.dart';
import '../repositories/users_repository.dart';
import '../services/api_service.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {

    Get.put(ApiService());
    Get.put(PhotosRepository());
    Get.put(PostsRepository());
    Get.put(TodosRepository());
    Get.put(UsersRepository());
  }
}

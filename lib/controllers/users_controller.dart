import 'package:get/get.dart';
import '../models/users_model.dart';
import '../repositories/users_repository.dart';

class UsersController extends GetxController {

  UsersRepository usersRepository=Get.find<UsersRepository>();
  final users = <User>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    try {
      final data = await usersRepository.getUsers();
      users.value = data;
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}

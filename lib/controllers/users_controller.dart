import 'package:get/get.dart';

import '../repositories/users_repository.dart';

class UsersController extends GetxController {
  final UsersRepository usersRepository;

  UsersController(this.usersRepository);

  final users = <dynamic>[].obs;

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
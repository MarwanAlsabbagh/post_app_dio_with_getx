import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../models/users_model.dart';
import '../services/api_service.dart';

class UsersRepository {

  final ApiService apiService = Get.find<ApiService>();

  Future<List<User>> getUsers() async {
    final response = await apiService.get('/users');
    return (response.data as List).map((json) => User.fromJson(json)).toList();
  }
}

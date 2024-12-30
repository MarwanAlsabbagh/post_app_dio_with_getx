import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

import '../models/photo_model.dart';
import '../services/api_service.dart';

class PhotosRepository extends GetxService {
  final ApiService apiService = Get.find<ApiService>();

  Future<List<Photo>> getPhotos() async {
    final response = await apiService.get('/photos');
    return (response.data as List).map((json) => Photo.fromJson(json)).toList();
  }
}

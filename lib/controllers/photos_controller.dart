import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../repositories/photos_repository.dart';

class PhotosController extends GetxController {
  final PhotosRepository photosRepository;

  PhotosController(this.photosRepository);

  final photos = <dynamic>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchPhotos();
  }

  Future<void> fetchPhotos() async {
    try {
      final data = await photosRepository.getPhotos();
      photos.value = data;
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
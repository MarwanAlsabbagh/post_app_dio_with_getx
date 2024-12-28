import 'package:get/get.dart';
import '../repositories/photos_repository.dart';
import '../models/photo_model.dart';

class PhotosController extends GetxController {

  PhotosRepository photosRepository=  Get.find<PhotosRepository>();
  final photos = <Photo>[].obs;

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

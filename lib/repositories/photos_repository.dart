import '../services/api_service.dart';

class PhotosRepository {
  final ApiService apiService;

  PhotosRepository(this.apiService);

  Future<List<dynamic>> getPhotos() async {
    final response = await apiService.get('/photos');
    return response.data;
  }
}
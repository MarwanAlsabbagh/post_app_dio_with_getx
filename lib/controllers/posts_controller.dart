import 'package:get/get.dart';
import '../models/post_model.dart';
import '../repositories/posts_repository.dart';

class PostsController extends GetxController {
  PostsRepository postsRepository=  Get.find<PostsRepository>();


  final posts = <dynamic>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    try {
      isLoading.value = true;
      final data = await postsRepository.getPosts();
      posts.value = data;
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
    finally {
      isLoading.value = false;
    }
  }

  Future<void> addPost(Post newPost) async {
    try {
      isLoading.value = true;
      final addedPost = await postsRepository.addPost(newPost);
      posts.add(addedPost);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }


  Future<void> updatePost(int id, Post updatedPost) async {
    try {
      isLoading.value = true;
      final updated = await postsRepository.updatePost(id, updatedPost);
      final index = posts.indexWhere((post) => post.id == id);
      if (index != -1) {
        posts[index] = updated;
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
  Future<void> deletePost(int id) async {
    try {
      isLoading.value = true;
      await postsRepository.deletePost(id);
      posts.removeWhere((post) => post['id'] == id);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
    finally {
      isLoading.value = false;
    }
  }
}

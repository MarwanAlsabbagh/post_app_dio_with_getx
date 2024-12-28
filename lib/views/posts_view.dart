import 'package:dio_getex_json_placeholder_app/views/widgets/add_post.dart';
import 'package:dio_getex_json_placeholder_app/views/widgets/edit_post.dart';
import 'package:dio_getex_json_placeholder_app/views/widgets/post_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/posts_controller.dart';

class PostsView extends StatelessWidget {
  final PostsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Get.dialog(AddPostDialog());
            },
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        if (controller.posts.isEmpty) {
          return Center(
            child: Text(
              'No posts available',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          );
        }
        return ListView.builder(
          itemCount: controller.posts.length,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          itemBuilder: (context, index) {
            final post = controller.posts[index];
            return PostItem(
              post: post,
              onEdit: () => Get.dialog(EditPostDialog(post: post)),
              onDelete: () => controller.deletePost(post.id),
            );
          },
        );
      }),
    );
  }
}

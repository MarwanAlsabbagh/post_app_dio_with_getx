import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/posts_controller.dart';
import '../../models/post_model.dart';

class AddPostDialog extends StatelessWidget {
  final titleController = TextEditingController();
  final bodyController = TextEditingController();
  final PostsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Post'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: titleController,
            decoration: InputDecoration(labelText: 'Title'),
          ),
          TextField(
            controller: bodyController,
            decoration: InputDecoration(labelText: 'Body'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            final newPost = Post(
              id: 0,
              title: titleController.text,
              body: bodyController.text,
              userId: 1,
            );
            controller.addPost(newPost);
            Get.back();
          },
          child: Text('Add'),
        ),
      ],
    );
  }
}

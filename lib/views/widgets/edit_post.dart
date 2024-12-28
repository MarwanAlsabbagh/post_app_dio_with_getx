import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/posts_controller.dart';

class EditPostDialog extends StatelessWidget {
  final Map<String, dynamic> post;
  final titleController = TextEditingController();
  final bodyController = TextEditingController();
  final PostsController controller = Get.find();

  EditPostDialog({required this.post}) {
    titleController.text = post['title'];
    bodyController.text = post['body'];
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Edit Post'),
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
            controller.updatePost(post['id'], {
              'title': titleController.text,
              'body': bodyController.text,
            });
            Get.back();
          },
          child: Text('Save'),
        ),
      ],
    );
  }
}

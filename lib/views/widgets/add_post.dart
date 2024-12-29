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
      title: Text('Add Post', style: TextStyle(fontWeight: FontWeight.bold)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: titleController,
            decoration: InputDecoration(
              labelText: 'Title',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 12),
          TextField(
            controller: bodyController,
            decoration: InputDecoration(
              labelText: 'Body',
              border: OutlineInputBorder(),
            ),
            maxLines: 3,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: Text('Cancel'),
        ),
        ElevatedButton(
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
          style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurpleAccent),
        ),
      ],
    );
  }
}

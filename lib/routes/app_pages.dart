import 'package:get/get_navigation/src/routes/get_route.dart';

import '../bindings/photos_binding.dart';
import '../bindings/posts_binding.dart';
import '../bindings/todos_binding.dart';
import '../bindings/users_binding.dart';
import '../views/home_view.dart';
import '../views/photos_view.dart';
import '../views/posts_view.dart';
import '../views/todos_view.dart';
import '../views/users_view.dart';

class AppPages {
  static const initial = '/home';

  static final routes = [
    GetPage(name: '/home', page: () => HomeView()),
    GetPage(name: '/posts', page: () => PostsView(), binding: PostsBinding()),
    GetPage(name: '/photos', page: () => PhotosView(), binding: PhotosBinding()),
    GetPage(name: '/todos', page: () => TodosView(), binding: TodosBinding()),
    GetPage(name: '/users', page: () => UsersView(), binding: UsersBinding()),
  ];
}
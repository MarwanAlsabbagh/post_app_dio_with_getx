import 'package:dio_getex_json_placeholder_app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'bindings/initial_binding.dart';

void main() {
  InitialBinding().dependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter GetX + Dio',
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.initial, // Define the initial route
      getPages: AppPages.routes, // Define the route mappings
    );
  }
}
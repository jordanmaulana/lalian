import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lalian/apps/main_nav/views/main_nav_view.dart';
import 'package:lalian/apps/setting/views/add_master_view.dart';

import 'routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Lalian',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainNavView(),
      getPages: [
        GetPage(
          name: Routes.main,
          page: () => const MainNavView(),
        ),
        GetPage(
          name: Routes.addMaster,
          page: () => const AddMasterView(),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lalian/apps/activity_history/views/activity_history_view.dart';
import 'package:lalian/apps/main_nav/views/main_nav_view.dart';
import 'package:lalian/apps/add_activity/views/add_activity_view.dart';
import 'package:lalian/db/controllers/base_controller.dart';
import 'package:lalian/core/widgets/loadings.dart';
import 'package:lalian/db/controllers/activity_watcher.dart';

import 'routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(BaseController());
    return SafeArea(
      child: GetMaterialApp(
        title: 'Lalian',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        getPages: [
          GetPage(
            name: Routes.main,
            page: () {
              return GetBuilder(
                builder: (BaseController controller) {
                  if (controller.loading) return const VLoading();
                  Get.put(ActivityWatcher());
                  return const MainNavView();
                },
              );
            },
          ),
          GetPage(
            name: Routes.addMaster,
            page: () => const AddActivity(),
          ),
          GetPage(
            name: Routes.activityHistory,
            page: () => const ActivityHistoryView(),
          ),
        ],
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:lalian/apps/activity_history/views/activity_history_view.dart';
import 'package:lalian/apps/main_nav/views/main_nav_view.dart';
import 'package:lalian/apps/add_activity/views/add_activity_view.dart';
import 'package:lalian/apps/reminder_add/views/add_reminder_view.dart';
import 'package:lalian/db/controllers/base_controller.dart';
import 'package:lalian/core/widgets/loadings.dart';
import 'package:lalian/db/controllers/activity_watcher.dart';

import 'routes.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

/// Streams are created so that app can respond to notification-related events
/// since the plugin is initialised in the `main` function
final StreamController<ReceivedNotification> didReceiveLocalNotificationStream =
    StreamController<ReceivedNotification>.broadcast();

final StreamController<String?> selectNotificationStream =
    StreamController<String?>.broadcast();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('app_icon');

  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );

  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onDidReceiveNotificationResponse:
        (NotificationResponse notificationResponse) {
      switch (notificationResponse.notificationResponseType) {
        case NotificationResponseType.selectedNotification:
          selectNotificationStream.add(notificationResponse.payload);
          break;
        case NotificationResponseType.selectedNotificationAction:
          selectNotificationStream.add(notificationResponse.payload);
          break;
      }
    },
    onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
  );
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
          GetPage(
            name: Routes.addReminder,
            page: () => const AddReminderView(),
          ),
        ],
      ),
    );
  }
}

class ReceivedNotification {
  ReceivedNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.payload,
  });

  final int id;
  final String? title;
  final String? body;
  final String? payload;
}

void notificationTapBackground(NotificationResponse notificationResponse) {
  // ignore: avoid_print
  print('notification(${notificationResponse.id}) action tapped: '
      '${notificationResponse.actionId} with'
      ' payload: ${notificationResponse.payload}');
  if (notificationResponse.input?.isNotEmpty ?? false) {
    // ignore: avoid_print
    print(
        'notification action tapped with input: ${notificationResponse.input}');
  }
}

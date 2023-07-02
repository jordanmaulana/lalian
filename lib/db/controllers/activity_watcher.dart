import 'dart:async';

import 'package:isar/isar.dart';
import 'package:lalian/db/models/activity/activity.dart';
import 'package:lalian/db/models/activity_log/activity_log.dart';
import 'package:lalian/export_controller.dart';

import 'base_controller.dart';

class ActivityWatcher extends GetxController {
  final BaseController _baseController = Get.find();
  late Isar isar;

  List<Activity> data = [];

  watchActivity() {
    Query<Activity> activityQuery = isar.activitys.buildQuery();

    Stream<List<Activity>> queryChanged =
        activityQuery.watch(fireImmediately: true);
    queryChanged.listen((data) {
      onActivityUpdate(data);
    });
  }

  onActivityUpdate(List<Activity> data) {
    this.data = data;
    update();
  }

  deleteActivity(Activity data) async {
    await isar.writeTxn(() async {
      await isar.activitys.delete(data.id);
    });
  }

  addLog(Activity data) async {
    ActivityLog log = ActivityLog(date: DateTime.now());
    log.activity.value = data;
    await isar.writeTxn(() async {
      await isar.activityLogs.put(log);
      await log.activity.save();
    });
    await log.activity.load();
    update(['${data.id}']);
  }

  @override
  void onInit() async {
    isar = _baseController.isar;
    watchActivity();
    super.onInit();
  }
}

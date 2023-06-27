import 'dart:io';

import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:lalian/db/models/activity_log/activity_log.dart';
import 'package:path_provider/path_provider.dart';

import '../models/activity/activity.dart';

class BaseController extends GetxController {
  late Isar isar;
  bool loading = true;

  @override
  void onInit() async {
    Directory dir = await getApplicationSupportDirectory();
    isar = await Isar.open(
      [ActivitySchema, ActivityLogSchema],
      directory: dir.path,
    );
    Get.log('isar base oninit');
    loading = false;
    update();
    super.onInit();
  }
}

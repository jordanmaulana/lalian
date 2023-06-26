import 'dart:io';

import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../db/models/activity.dart';

class BaseController extends GetxController {
  late Isar isar;

  @override
  void onInit() async {
    Directory dir = await getApplicationSupportDirectory();
    isar = await Isar.open(
      [ActivitySchema],
      directory: dir.path,
    );
    super.onInit();
  }
}

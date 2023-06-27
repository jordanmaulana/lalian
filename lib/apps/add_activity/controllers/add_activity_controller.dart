import 'package:flutter/material.dart';
import 'package:lalian/db/controllers/base_controller.dart';
import 'package:lalian/core/widgets/popup.dart';
import 'package:lalian/db/models/activity/activity.dart';

import '../../../export_controller.dart';

class AddActivityController extends GetxController {
  final BaseController _baseController = Get.find();
  RxString icon = ''.obs;
  setIcon(String data) => icon(data);

  TextEditingController nameField = TextEditingController();

  String validateInput() {
    String error = '';
    if (nameField.text.isEmpty) error += 'Nama aktivitas tidak boleh kosong\n';
    if (icon.value.isEmpty) error += 'Pilih icon dulu';
    return error;
  }

  submit() async {
    String error = validateInput();
    if (error.isNotEmpty) {
      VPopup.error(error);
      return;
    }

    await _baseController.isar.writeTxn(() async {
      await _baseController.isar.activitys.put(
          Activity(name: nameField.text, icon: icon.value)); // insert & update
    });
    Get.back();
  }
}

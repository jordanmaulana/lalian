import 'package:flutter/material.dart';
import 'package:lalian/base/base_controller.dart';
import 'package:lalian/core/widgets/popup.dart';
import 'package:lalian/db/models/activity.dart';

import '../../../export_controller.dart';

class AddActivityController extends BaseController {
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

    await isar.writeTxn(() async {
      await isar.activitys.put(
          Activity(name: nameField.text, icon: icon.value)); // insert & update
    });
    Get.back();
  }
}

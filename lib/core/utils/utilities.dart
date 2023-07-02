import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

import 'colors.dart';

class VUtils {
  VUtils._();

  static String parsePriceValue(int price, {bool thousandSeperated = true}) {
    String returnValue;
    returnValue = price.toRadixString(10);

    if (thousandSeperated) {
      const currentFormat = '#,###,###';
      final numberFormat = NumberFormat(currentFormat, 'id');
      returnValue = numberFormat.format(double.parse(returnValue));
    }
    return returnValue;
  }

  static successSnackbar({String? title, required String message}) {
    Get.snackbar(
      title ?? 'SUKSES',
      message,
      colorText: VColor.white,
      icon: const Icon(
        Icons.check_circle_outline_rounded,
        color: VColor.white,
      ),
    );
  }

  static String formatDate(DateTime? data, {bool useToday = true}) {
    if (data == null) return '';
    String time;
    DateTime now = DateTime.now();
    if (data.year == now.year &&
        data.month == now.month &&
        data.day == now.day &&
        useToday) {
      time = 'Hari ini ${dateToString(data, 'HH:mm')}';
    } else {
      time = dateToString(data, 'd MMMM yyyy HH:mm');
    }
    return time;
  }

  static String dateToString(DateTime? time, String format) {
    if (time == null) return '-';

    var formatter = DateFormat(format);
    String formatted = formatter.format(time);
    return formatted;
  }

  static String dateToUpload(DateTime? time) {
    return dateToString(time, 'yyyy-MM-dd');
  }

  static String getPrettyJSONString(jsonObject) {
    if (jsonObject == null) return '';
    try {
      var encoder = const JsonEncoder.withIndent('     ');
      return encoder.convert(jsonObject);
    } catch (e) {
      Get.log(e.toString());
      return '';
    }
  }

  static void hideKeyboard(context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static Future<Map<String, dynamic>?> pickDate(context) async {
    DateTime now = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      lastDate: now,
      firstDate: DateTime(2022),
      initialDate: now,
    );
    if (picked != null) {
      return {
        "date": picked,
        "string": dateToString(picked, "yyyy-MM-dd"),
      };
    }
    return null;
  }
}

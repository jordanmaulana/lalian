import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lalian/core/utils/colors.dart';
import 'package:lalian/routes.dart';

import '../../../core/widgets/texts.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.addMaster),
        backgroundColor: VColor.primaryButton,
        child: const Icon(Icons.add),
      ),
      body: Stack(
        children: [
          Image.asset('assets/images/setting_header.png'),
          const Positioned(
            left: 24.0,
            top: 80.0,
            child: VText(
              'Daftar\naktivitas',
              fontSize: 24.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

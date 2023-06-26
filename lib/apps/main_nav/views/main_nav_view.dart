import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lalian/apps/activity/views/activity_view.dart';
import 'package:lalian/apps/reminder/views/reminder_view.dart';
import 'package:lalian/apps/setting/views/setting_view.dart';
import 'package:lalian/core/utils/colors.dart';

import '../controllers/main_nav_controller.dart';

class MainNavView extends StatelessWidget {
  const MainNavView({super.key});

  @override
  Widget build(BuildContext context) {
    MainNavController controller = Get.put(MainNavController());

    return Scaffold(
      body: Obx(() {
        switch (controller.index.value) {
          case 0:
            return const ActivityView();
          case 1:
            return const ReminderView();
          case 2:
            return const SettingView();
          default:
            return Container();
        }
      }),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.index.value,
          onTap: controller.setIndex,
          selectedItemColor: VColor.dark,
          unselectedItemColor: VColor.bottomGrey,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/main_nav/activity.svg',
                colorFilter: VColor.colorFilterFromColor(
                    controller.index.value == 0
                        ? VColor.dark
                        : VColor.bottomGrey),
              ),
              label: 'Aktifitas',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/main_nav/reminder.svg',
                colorFilter: VColor.colorFilterFromColor(
                    controller.index.value == 1
                        ? VColor.dark
                        : VColor.bottomGrey),
              ),
              label: 'Pengingat',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/main_nav/setting.svg',
                colorFilter: VColor.colorFilterFromColor(
                    controller.index.value == 2
                        ? VColor.dark
                        : VColor.bottomGrey),
              ),
              label: 'Pengaturan',
            ),
          ],
        ),
      ),
    );
  }
}

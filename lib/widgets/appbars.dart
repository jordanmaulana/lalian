import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../core/utils/colors.dart';

class TransparentAppBar extends StatelessWidget {
  const TransparentAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: IconButton(
        icon: const FaIcon(
          FontAwesomeIcons.chevronLeft,
          color: VColor.dark,
          size: 18.0,
        ),
        onPressed: () => Get.back(),
      ),
    );
  }
}

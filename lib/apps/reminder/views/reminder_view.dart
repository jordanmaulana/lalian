import 'package:flutter/material.dart';

import '../../../core/utils/colors.dart';
import '../../../core/widgets/texts.dart';

class ReminderView extends StatelessWidget {
  const ReminderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: VColor.primaryButton,
        child: const Icon(Icons.add),
      ),
      body: Stack(
        children: [
          Image.asset('assets/images/reminder_header.png'),
          const Positioned(
            left: 24.0,
            top: 80.0,
            child: VText(
              'Peingingat',
              fontSize: 24.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

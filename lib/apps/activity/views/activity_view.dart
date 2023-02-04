import 'package:flutter/material.dart';
import 'package:lalian/core/widgets/texts.dart';

class ActivityView extends StatelessWidget {
  const ActivityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/images/activity_header.png'),
          const Positioned(
            left: 24.0,
            top: 80.0,
            child: VText(
              'Mau catat\naktivitas apa\nhari ini?',
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:lalian/routes.dart';

import '../../../export_view.dart';

class ReminderView extends StatelessWidget {
  const ReminderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.addReminder);
        },
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

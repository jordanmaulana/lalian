import 'package:lalian/apps/activity/views/activity_time.dart';
import 'package:lalian/db/controllers/activity_watcher.dart';
import 'package:lalian/db/models/activity/activity.dart';
import 'package:lalian/export_view.dart';

class ActivityView extends StatelessWidget {
  const ActivityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset('assets/images/activity_header.png'),
              const Positioned(
                left: 24.0,
                top: 80.0,
                child: VText(
                  'Mau catat\naktivitas apa\nhari ini?',
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Expanded(
            child: GetBuilder(
              builder: (ActivityWatcher controller) {
                return GridView.builder(
                  padding: const EdgeInsets.all(16.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    crossAxisCount: 2,
                  ),
                  itemCount: controller.data.length,
                  itemBuilder: (BuildContext ctx, index) {
                    Activity data = controller.data[index];
                    return InkWell(
                      onDoubleTap: () {
                        controller.addLog(data);
                      },
                      child: Container(
                        decoration: VStyle.boxShadow(),
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(
                                  data.icon!,
                                  width: double.infinity,
                                ),
                              ),
                            ),
                            VText(data.name),
                            GetBuilder(
                              id: '${data.id}',
                              builder: (ActivityWatcher controller) {
                                return ActivityTime(data.logs);
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

import '../../../db/controllers/activity_watcher.dart';
import '../../../db/models/activity/activity.dart';
import '../../../export_view.dart';
import '../../../widgets/appbars.dart';

class AddReminderView extends StatelessWidget {
  const AddReminderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TransparentAppBar(),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: VColor.header,
            padding: const EdgeInsets.all(16.0),
            child: const VText(
              'Tambah Pengingat',
              fontSize: 25.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const VText('Waktu'),
                  TextFormField(),
                  const SizedBox(height: 16.0),
                  const VText('Pilih Aktivitas'),
                  Expanded(
                    child: GetBuilder(
                      builder: (ActivityWatcher controller) {
                        return GridView.builder(
                          padding: const EdgeInsets.all(16.0),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1.0,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                            crossAxisCount: 3,
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
                                padding: const EdgeInsets.all(4.0),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: SvgPicture.asset(
                                        data.icon!,
                                        width: double.infinity,
                                      ),
                                    ),
                                    const SizedBox(height: 4.0),
                                    VText(
                                      data.name,
                                      align: TextAlign.center,
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
            ),
          ),
        ],
      ),
    );
  }
}

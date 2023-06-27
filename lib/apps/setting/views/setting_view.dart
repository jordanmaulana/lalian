import 'package:lalian/core/widgets/lists.dart';
import 'package:lalian/db/controllers/activity_watcher.dart';
import 'package:lalian/db/models/activity/activity.dart';
import 'package:lalian/routes.dart';

import '../../../export_view.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    ActivityWatcher dbWatcher = Get.find();
    return Scaffold(
      backgroundColor: VColor.grey,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.addMaster),
        backgroundColor: VColor.primaryButton,
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Stack(
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
          Expanded(
            child: GetBuilder(
              builder: (ActivityWatcher controller) {
                return VList(
                  loading: false,
                  length: controller.data.length,
                  itemBuilder: (c, i) {
                    Activity data = controller.data[i];
                    return ListTile(
                      leading: SvgPicture.asset(data.icon!),
                      title: VText(data.name),
                      tileColor: VColor.white,
                      trailing: InkWell(
                        child: SvgPicture.asset('assets/icons/delete.svg'),
                        onTap: () => dbWatcher.deleteActivity(data),
                      ),
                    );
                  },
                  onRefresh: () async {
                    return;
                  },
                  errorMsg: '',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

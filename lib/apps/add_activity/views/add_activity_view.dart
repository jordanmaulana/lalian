import 'package:lalian/apps/add_activity/controllers/add_activity_controller.dart';
import 'package:lalian/widgets/appbars.dart';
import 'package:lalian/widgets/icons.dart';

import '../../../export_view.dart';

class AddActivity extends StatelessWidget {
  const AddActivity({super.key});

  @override
  Widget build(BuildContext context) {
    AddActivityController controller = Get.put(AddActivityController());
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 240.0,
            color: VColor.header,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TransparentAppBar(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      VText(
                        'Tambah Aktivitas',
                        fontSize: 25.0,
                        fontWeight: FontWeight.w600,
                      ),
                      VText('Nama'),
                      VFormInput(
                        hint: 'Olah Raga',
                        textCapitalization: TextCapitalization.words,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const VText('Pilih icon'),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1.0,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        crossAxisCount: 4,
                      ),
                      itemCount: lalianIcons.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return InkWell(
                          onTap: () => controller.setIcon(lalianIcons[index]),
                          child: Obx(
                            () => Container(
                              decoration: VStyle.boxShadow(
                                shadowColor:
                                    controller.icon.value == lalianIcons[index]
                                        ? VColor.red
                                        : null,
                              ),
                              padding: const EdgeInsets.all(24.0),
                              child: SvgPicture.asset(lalianIcons[index]),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SecondaryButton(
                          label: 'Batalkan',
                          onTap: () {},
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: PrimaryButton(
                          label: 'Simpan',
                          onTap: () {},
                        ),
                      ),
                    ],
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

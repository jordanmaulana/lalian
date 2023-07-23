import 'package:lalian/apps/add_activity/controllers/add_activity_controller.dart';
import 'package:lalian/core/utils/v_constants.dart';
import 'package:lalian/widgets/appbars.dart';

import '../../../export_view.dart';

class AddActivity extends StatelessWidget {
  const AddActivity({super.key});

  @override
  Widget build(BuildContext context) {
    AddActivityController controller = Get.put(AddActivityController());
    return Scaffold(
      appBar: const TransparentAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            color: VColor.header,
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const VText(
                        'Tambah Aktivitas',
                        fontSize: 25.0,
                        fontWeight: FontWeight.w600,
                      ),
                      VFormInput(
                        label: 'Nama Aktivitas',
                        hint: 'Olah Raga',
                        textCapitalization: TextCapitalization.words,
                        maxLines: 1,
                        controller: controller.nameField,
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
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1.0,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        crossAxisCount: 4,
                      ),
                      itemCount: VConst.lalianIcons.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return InkWell(
                          onTap: () =>
                              controller.setIcon(VConst.lalianIcons[index]),
                          child: Obx(
                            () => Container(
                              decoration: VStyle.boxShadow(
                                shadowColor: controller.icon.value ==
                                        VConst.lalianIcons[index]
                                    ? VColor.red
                                    : null,
                              ),
                              padding: const EdgeInsets.all(24.0),
                              child:
                                  SvgPicture.asset(VConst.lalianIcons[index]),
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
                          onTap: () => controller.submit(),
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

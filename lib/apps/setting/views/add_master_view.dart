import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lalian/core/utils/colors.dart';
import 'package:lalian/core/widgets/buttons.dart';
import 'package:lalian/core/widgets/inputs.dart';
import 'package:lalian/core/widgets/styles.dart';
import 'package:lalian/core/widgets/texts.dart';
import 'package:lalian/widgets/appbars.dart';
import 'package:lalian/widgets/icons.dart';

class AddMasterView extends StatelessWidget {
  const AddMasterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 240.0,
            color: VColor.header,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TransparentAppBar(),
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
                      const VText('Nama'),
                      const VFormInput(
                        hint: 'Olah Raga',
                        textCapitalization: TextCapitalization.words,
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
                        return Container(
                          decoration: VStyle.boxShadow(),
                          padding: const EdgeInsets.all(24.0),
                          child: SvgPicture.asset(lalianIcons[index]),
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

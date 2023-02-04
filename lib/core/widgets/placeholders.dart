import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'texts.dart';

class VError extends StatelessWidget {
  final String errorMsg;

  const VError(this.errorMsg, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: VText(errorMsg, align: TextAlign.center),
      ),
    );
  }
}

class NoData extends StatelessWidget {
  final String? text;

  const NoData({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: VText(
          text ?? 'Tidak ada data',
          fontSize: 20,
          align: TextAlign.center,
        ),
      ),
    );
  }
}

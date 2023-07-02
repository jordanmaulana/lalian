import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:lalian/core/utils/colors.dart';
import 'package:lalian/core/utils/utilities.dart';
import 'package:lalian/core/widgets/texts.dart';
import 'package:lalian/db/models/activity_log/activity_log.dart';

class ActivityTime extends StatefulWidget {
  final IsarLinks<ActivityLog> data;

  const ActivityTime(this.data, {super.key});

  @override
  State<ActivityTime> createState() => _ActivityTimeState();
}

class _ActivityTimeState extends State<ActivityTime> {
  @override
  void initState() {
    init();
    super.initState();
  }

  init() async {
    await widget.data.load();
    setState(() {});
  }

  @override
  void didUpdateWidget(covariant oldWidget) {
    widget.data.load(overrideChanges: false).then((value) {
      setState(() {});
    });
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.data.isEmpty) return const VText('-');
    return VText(
      VUtils.formatDate(widget.data.last.date),
      color: VColor.hint,
    );
  }
}

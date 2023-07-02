import 'package:isar/isar.dart';
import 'package:lalian/db/models/activity_log/activity_log.dart';

part 'activity.g.dart';

@collection
class Activity {
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment

  @Index(type: IndexType.value)
  String? name;

  String? icon;

  @enumerated
  IconSource iconSource = IconSource.asset;

  @Backlink(to: 'activity')
  final logs = IsarLinks<ActivityLog>();

  Activity({
    required this.name,
    required this.icon,
    this.iconSource = IconSource.asset,
  });
}

enum IconSource {
  asset,
  file,
}

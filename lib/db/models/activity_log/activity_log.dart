import 'package:isar/isar.dart';
import 'package:lalian/db/models/activity/activity.dart';
part 'activity_log.g.dart';

@collection
class ActivityLog {
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment

  @Index(type: IndexType.value)
  DateTime date;

  final activity = IsarLink<Activity>();

  ActivityLog({required this.date});
}

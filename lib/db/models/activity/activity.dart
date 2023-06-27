import 'package:isar/isar.dart';

part 'activity.g.dart';

@collection
class Activity {
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment

  @Index(type: IndexType.value)
  String? name;

  String? icon;

  @enumerated
  IconSource iconSource = IconSource.asset;

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

import 'package:hive_flutter/adapters.dart';
part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel extends HiveObject {
  @HiveField(0)
  String name = '';
  @HiveField(1)
  int id = 0;
  @HiveField(2)
  bool isCompleted = false;
  @HiveField(3)
  Prioritys priority = Prioritys.low;
}

@HiveType(typeId: 1)
enum Prioritys {
  @HiveField(0)
  low,
  @HiveField(1)
  normal,
  @HiveField(2)
  high,
}

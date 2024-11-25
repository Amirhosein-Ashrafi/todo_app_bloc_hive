import 'package:seven_learn_todo_list/features/home_screen/data/models/task_model.dart';

abstract class DataSource<T> {
  Future<List<TaskModel>> getAll();
  Future<T> findById(int id);
  Future<void> deleteAll();
  Future<void> deleteById(int id);
  Future<void> delete(T data);
  Future<T> createOrUpdate(T data);
  int getCount();
}

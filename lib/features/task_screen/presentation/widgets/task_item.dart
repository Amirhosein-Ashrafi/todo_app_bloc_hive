import 'package:flutter/material.dart';
import 'package:seven_learn_todo_list/features/home_screen/data/models/task_model.dart';
import 'package:seven_learn_todo_list/features/task_screen/presentation/widgets/check_box.dart';

class TaskItem extends StatefulWidget {
  const TaskItem({
    super.key,
    required this.task,
  });

  final TaskModel task;

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  @override

  /// A widget representing a single task.
  ///
  /// It shows a [MyChecBox] and a [Text] of the task's name. The [MyChecBox] is
  /// checked if the task is completed, and unchecked otherwise. If the task is
  /// completed, the [Text] is struckthrough. The entire widget is wrapped in a
  /// [InkWell] so that the user can tap on it to toggle the task's completion
  /// status.
  ///
  /// The widget is decorated with a shadow and a rounded corner.
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return InkWell(
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        setState(() {
          widget.task.isCompleted = !widget.task.isCompleted;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(top: 8),
        height: 84,
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 4,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Row(
              children: [
                MyChecBox(
                  isChecked: widget.task.isCompleted,
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Text(
                    widget.task.name,
                    style: TextStyle(
                      fontSize: 20,
                      decoration: widget.task.isCompleted
                          ? TextDecoration.lineThrough
                          : null,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
// import 'package:provider/provider.dart';
import 'package:seven_learn_todo_list/features/home_screen/data/models/task_model.dart';
// import 'package:seven_learn_todo_list/features/home_screen/data/repository/task_repository.dart';
import 'package:seven_learn_todo_list/features/task_screen/presentation/view/task_screen.dart';
import 'package:seven_learn_todo_list/features/task_screen/presentation/widgets/task_list.dart';
import 'package:seven_learn_todo_list/main.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      left: false,
      right: false,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditTaskScreen(
                  task: TaskModel(),
                ),
              ),
            );
          },
          label: const Row(
            children: [
              Text("Add Task"),
              SizedBox(width: 4),
              Icon(CupertinoIcons.add_circled)
            ],
          ),
        ),
        body: SafeArea(
          top: true,
          child: Column(
            children: [
              Container(
                height: 112,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      primaryColor,
                      primaryColor.withOpacity(0.5),
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "To Do List",
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              final snackBar = SnackBar(
                                content: const Text('Share Successfully!'),
                                action: SnackBarAction(
                                  backgroundColor: primaryColor,
                                  label: 'Undo',
                                  textColor: Colors.white,
                                  onPressed: () {},
                                ),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            },
                            child: const Icon(
                              CupertinoIcons.share_up,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 38,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(19),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: primaryColor.withOpacity(0.1),
                              blurRadius: 0,
                            ),
                          ],
                        ),
                        child: const TextField(
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                            iconColor: secondaryTextColor,
                            labelStyle: TextStyle(color: secondaryTextColor),
                            hintText: "Search Tasks",
                            prefixIcon: Icon(CupertinoIcons.search),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ValueListenableBuilder<Box<TaskModel>>(
                  valueListenable:
                      Hive.box<TaskModel>(taskBoxName).listenable(),
                  builder: (context, box, child) {
                    final tasks = box.values.toList().cast<TaskModel>();
                    if (tasks.isEmpty) {
                      return const Center(
                        child: Text(
                          "No tasks available.",
                          style: TextStyle(color: secondaryTextColor),
                        ),
                      );
                    }
                    return TaskList(tasks);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

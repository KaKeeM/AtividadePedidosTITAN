import 'package:flutter/material.dart';
import '../model/task_model.dart';
import '../widgets/category_widget.dart';
import '../theme/app_theme.dart';
import '../widgets/create_tasks_widget.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {

  void toggleTask(TaskModel task) {
    setState(() {
      task.completed = !task.completed;
    });
  }

  Map<String, List<TaskModel>> categories = {
    'Design': [
      TaskModel(
        title: 'Trocar a cor do texto',
        date: DateTime.now(),
      ),

      TaskModel(
        title: 'Organizar as paletas',
        date: DateTime.now(),
      ),
    ],

    'Study': [
      TaskModel(
        title: 'Estudar Flutter',
        date: DateTime.now(),
      ),

      TaskModel(
        title: 'Fazer exercícios',
        date: DateTime.now(),
      ),
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: Padding(
            padding: const EdgeInsets.all(12),
            child: const Text('Tasks', style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: categories.entries.map((category) {
            return CategoryWidget (

              title: category.key,
              tasks: category.value,
              onTaskReceived: (task, categoryName) {
                setState(() {
                  for (var category in categories.values) {
                    category.remove(task);
                  }

                  categories[categoryName]!.add(task);
                });
              },
              onTaskCompleted: toggleTask,
            );
          }).toList(),
        )
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context){
                  return Dialog(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.background,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.all(20),
                      child: CreateTaskWidget(
                        categories: categories.keys.toList(),
                        onCreateTask: (title, category, date) {
                          setState(() {
                            categories[category]!.add(
                              TaskModel(
                                title: title,
                                date: date,
                              ),
                            );
                          });

                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  );
                }
              );
            },
        shape: const CircleBorder(),
        backgroundColor: Colors.black,
        child: Icon(Icons.add,
          color: AppColors.surface
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import '../model/task_model.dart';
import 'task_widget.dart';

class CategoryWidget  extends StatelessWidget {
  final String title;
  final List<TaskModel> tasks;
  final Function(TaskModel, String) onTaskReceived;
  final Function(TaskModel) onTaskCompleted;

  const CategoryWidget({
    super.key,
    required this.title,
    required this.tasks,
    required this.onTaskReceived,
    required this.onTaskCompleted,
  });
  @override
  Widget build(BuildContext context) {
    return DragTarget<TaskModel>(
      onAcceptWithDetails: (details) {
        onTaskReceived(
          details.data,
          title,
        );
      },

      builder: (context, candidateData, rejectedData) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                title.toUpperCase(),
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w100,
                  color: Colors.red[200],
                ),
              ),
            ),

            const SizedBox(height: 10),
            ...tasks.map(
                  (task) => Task(
                task: task,
                    onTaskCompleted: onTaskCompleted,
              ),
            ),
          ],
        );
      },
    );
  }
}
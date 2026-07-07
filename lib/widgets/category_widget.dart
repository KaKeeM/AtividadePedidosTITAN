import 'package:flutter/material.dart';
import 'tasks_widget.dart';

class TasksWidget extends StatelessWidget {
  final String title;
  final List<String> tasks;
  final Function(String, String) onTaskReceived;

  const TasksWidget({
    super.key,
    required this.title,
    required this.tasks,
    required this.onTaskReceived,
  });

  @override
  Widget build(BuildContext context) {
    return DragTarget<String>(
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
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
              ...tasks.map(
                  (task) =>
                  Task(
                    title: task,
                  ),
              ),
            ],
          );
      }
    );
  }
}
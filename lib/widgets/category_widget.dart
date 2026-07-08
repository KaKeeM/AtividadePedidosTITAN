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
                title: task,
              ),
            ),

          ],
        );
      },
    );
  }
}
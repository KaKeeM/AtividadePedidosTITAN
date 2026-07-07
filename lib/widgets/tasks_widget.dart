
import 'package:flutter/material.dart';

class TasksWidget extends StatelessWidget {
  final String title;
  final List<String> tasks;

  const TasksWidget({
    super.key,
    required this.title,
    required this.tasks,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        ...tasks.map(
              (task) => Row(
                children: [
                  Checkbox(
                      value: false,
                      onChanged: (value){},
                  ),
                  Text(task)
                ],
              ),
        )
      ],
    );
  }
}
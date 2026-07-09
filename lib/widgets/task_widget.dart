import 'package:flutter/material.dart';
import 'package:larica_ufba/theme/app_theme.dart';
import '../model/task_model.dart';

class Task extends StatelessWidget {
  final TaskModel task;
  final Function(TaskModel) onTaskCompleted;

  const Task({
    super.key,
    required this.task,
    required this.onTaskCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: task.completed
            ? AppColors.background
            : AppColors.surface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: task.completed
              ? AppColors.topSurface
              : AppColors.surface,
          width: 2,
        ),
      ),
      child: Row(
        children: [
          Checkbox(
            activeColor: task.completed ? AppColors.topSurface : AppColors.black,
            value: task.completed,
            onChanged: (value) {
              onTaskCompleted(task);
            },
          ),

          Text(
            task.title,
            style: TextStyle(
              color: task.completed
                  ? AppColors.topSurface
                  : AppColors.black,
              decoration: task.completed
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
              decorationColor: AppColors.topSurface,
              decorationThickness: 2,
            ),
          ),

          const Spacer(),

          Draggable<TaskModel>(
            data: task,

            feedback: Material(
              child: Container(
                padding: const EdgeInsets.all(10),
                color: Colors.grey[100],
                child: Text(task.title),
              ),
            ),

            child: Padding(
              padding: const EdgeInsets.only(right: 4),
              child: Icon(
                Icons.drag_indicator,
                color: AppColors.topSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
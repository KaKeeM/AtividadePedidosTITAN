import 'package:flutter/material.dart';
import 'package:larica_ufba/theme/app_theme.dart';

class Task extends StatelessWidget {
  final String title;

  const Task({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),

      child: Row(
        children: [

          Checkbox(
            value: false,
            onChanged: (value) {},
          ),

          Text(title),

          const Spacer(),

          Draggable<String>(
            data: title,

            feedback: Material(
              child: Container(
                padding: const EdgeInsets.all(10),
                color: Colors.grey[100],
                child: Text(title),
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
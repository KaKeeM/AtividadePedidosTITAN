import 'package:flutter/material.dart';

class Task extends StatelessWidget {
  final String title;

  const Task({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {

    return Draggable(
      data: title,
      feedback: Material(
        child: Container(
          padding: const EdgeInsets.all(10),
          color: Colors.red,
          child: Text(title),
        ),
      ),
      child: Container(
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
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import '../widgets/category_widget.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {

  Map<String, List<String>> categories = {
    'Design': [
      'Trocar a cor do texto',
      'Organizar as paletas',
    ],

    'Study': [
      'Estudar Flutter',
      'Fazer exercícios',
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            return TasksWidget(
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
            );
          }).toList(),
        )
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {

          },
        shape: const CircleBorder(),
        backgroundColor: Colors.black,
        child: Icon(Icons.add,
          color: Colors.white
        ),
      ),
    );
  }
}
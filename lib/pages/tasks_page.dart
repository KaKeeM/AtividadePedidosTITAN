import 'package:flutter/material.dart';
import '../widgets/tasks_widget.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // apagar
        backgroundColor: Colors.red,
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
          children: [
            TasksWidget(
              title: 'Test',
              tasks: [
                'Trocar a cor do texto',
                'Organizar as paletas',
              ],
            ),
          ],
        ),
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
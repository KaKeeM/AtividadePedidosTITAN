import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class CreateTaskWidget extends StatefulWidget {

  final List<String> categories;
  final Function(String, String, DateTime) onCreateTask;

  const CreateTaskWidget({
    super.key,
    required this.categories,
    required this.onCreateTask,
  });

  @override
  State<CreateTaskWidget> createState() => _CreateTaskWidgetState();
}


class _CreateTaskWidgetState extends State<CreateTaskWidget> {
  final TextEditingController titleController = TextEditingController();
  DateTime? selectedDate;
  String? selectedCategory;

  Future<void> selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      initialDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Nova Tarefa",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextField(
            controller: titleController,
            decoration: const InputDecoration(
              labelText: 'Título',
              hintText: 'Digite o nome da tarefa',
            ),
          ),
          DropdownButtonFormField<String>(
            initialValue: selectedCategory,
            decoration: const InputDecoration(
              labelText: 'Categoria',
            ),
            items: widget.categories.map((category) {
              return DropdownMenuItem<String>(
                value: category,
                child: Text(category),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedCategory = value;
              });
            },
          ),
          InkWell(
            onTap: selectDate,
            child: InputDecorator(
              decoration: const InputDecoration(
                labelText: 'Data',
              ),

              child: Text(
                selectedDate == null
                    ? 'Escolha uma data'
                    : '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                widget.onCreateTask(
                  titleController.text,
                  selectedCategory!,
                  selectedDate ?? DateTime.now(),
                );
          },
              child: const Text('Criar')
          ),
        ],
      ),
    );
  }
}
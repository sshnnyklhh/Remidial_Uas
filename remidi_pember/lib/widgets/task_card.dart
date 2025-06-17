import 'package:flutter/material.dart';
import '../models/task_model.dart';

class TaskCard extends StatelessWidget {
  final TaskModel task;
  final Function(bool?) onChanged;
  final VoidCallback onTap;

  const TaskCard({
    super.key,
    required this.task,
    required this.onChanged,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          task.judul,
          style: TextStyle(
            decoration: task.status == 'Sudah Selesai'
                ? TextDecoration.lineThrough
                : null,
          ),
        ),
        subtitle: Text('${task.kategori} • ${task.deadline}'),
        leading: Checkbox(
          value: task.status == 'Sudah Selesai',
          onChanged: onChanged,
        ),
        onTap: onTap,
      ),
    );
  }
}

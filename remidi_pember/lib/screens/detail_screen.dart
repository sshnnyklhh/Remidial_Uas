import 'package:flutter/material.dart';
import '../models/task_model.dart';

class DetailScreen extends StatelessWidget {
  final TaskModel task;

  const DetailScreen({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Tugas')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Judul: ${task.judul}', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            Text('Kategori: ${task.kategori}'),
            const SizedBox(height: 10),
            Text('Deadline: ${task.deadline}'),
            const SizedBox(height: 10),
            Text('Status: ${task.status}'),
            const SizedBox(height: 20),
            task.gambar.isNotEmpty
                ? Image.network(task.gambar)
                : const Text('Tidak ada gambar'),
          ],
        ),
      ),
    );
  }
}

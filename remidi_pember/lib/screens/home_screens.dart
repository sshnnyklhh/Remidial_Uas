import 'package:flutter/material.dart';
import '../services/firebase_service.dart';
import '../models/task_model.dart';
import 'add_task_screen.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseService _firebaseService = FirebaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('To-Do List Mahasiswa')),
      body: StreamBuilder(
        stream: _firebaseService.getTasks(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!.snapshot.value;
            if (data == null) {
              return const Center(child: Text('Belum ada tugas'));
            }

            final Map<String, dynamic> tasks = Map<String, dynamic>.from(data as Map);
            final taskList = tasks.entries.map((e) => TaskModel.fromJson(e.key, e.value)).toList();

            return ListView.builder(
              itemCount: taskList.length,
              itemBuilder: (context, index) {
                final task = taskList[index];
                return ListTile(
                  title: Text(task.judul),
                  subtitle: Text('${task.kategori} - ${task.deadline}'),
                  trailing: Checkbox(
                    value: task.status == 'Sudah Selesai',
                    onChanged: (val) async {
                      final newStatus = val! ? 'Sudah Selesai' : 'Belum Selesai';
                      await _firebaseService.updateTaskStatus(task.id!, newStatus);
                    },
                  ),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(task: task),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AddTaskScreen()),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}

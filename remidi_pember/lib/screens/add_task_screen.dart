import 'package:flutter/material.dart';
import '../models/task_model.dart';
import '../services/firebase_service.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _formKey = GlobalKey<FormState>();
  final _judulController = TextEditingController();
  final _deadlineController = TextEditingController();
  String? _kategori;

  final List<String> kategoriList = ['Kuliah', 'Organisasi', 'Lainnya'];

  @override
  void dispose() {
    _judulController.dispose();
    _deadlineController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final task = TaskModel(
        idTugas: DateTime.now().millisecondsSinceEpoch.toString(),
        judul: _judulController.text,
        kategori: _kategori ?? 'Lainnya',
        deadline: _deadlineController.text,
        status: 'Belum Selesai',
        gambar: '',
      );
      FirebaseService().addTask(task);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tambah Tugas')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _judulController,
                decoration: const InputDecoration(labelText: 'Judul'),
                validator: (value) => value!.isEmpty ? 'Judul wajib diisi' : null,
              ),
              TextFormField(
                controller: _deadlineController,
                decoration: const InputDecoration(labelText: 'Deadline (YYYY-MM-DD)'),
                validator: (value) => value!.isEmpty ? 'Deadline wajib diisi' : null,
              ),
              DropdownButtonFormField<String>(
                value: _kategori,
                hint: const Text('Pilih Kategori'),
                items: kategoriList.map((kategori) {
                  return DropdownMenuItem(value: kategori, child: Text(kategori));
                }).toList(),
                onChanged: (value) => setState(() => _kategori = value),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submit,
                child: const Text('Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:firebase_database/firebase_database.dart';
import '../models/task_model.dart';

class FirebaseService {
  final FirebaseDatabase database = FirebaseDatabase(
    databaseURL: 'https://shenyklfh-default-rtdb.firebaseio.com/',
  );

  final DatabaseReference _db;

  FirebaseService() : _db = FirebaseDatabase(
    databaseURL: 'https://shenyklfh-default-rtdb.firebaseio.com/',
  ).ref().child('tasks');

  Future<void> addTask(TaskModel task) async {
    final newTaskRef = _db.push();
    task.id = newTaskRef.key;
    await newTaskRef.set(task.toJson());
  }

  Stream<DatabaseEvent> getTasks() {
    return _db.onValue;
  }

  Future<void> updateTaskStatus(String id, String status) async {
    await _db.child(id).update({'status': status});
  }

  Future<void> updateTask(TaskModel task) async {
    await _db.child(task.id!).set(task.toJson());
  }

  Future<void> deleteTask(String id) async {
    await _db.child(id).remove();
  }

  Future<void> uploadImageUrl(String id, String url) async {
    await _db.child(id).update({'gambar': url});
  }
}

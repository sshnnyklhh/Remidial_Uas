import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/home_screens.dart'; // <- nama file benar

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do List Mahasiswa',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const HomeScreen(), // <- class name benar
      debugShowCheckedModeBanner: false,
    );
  }
}







// Nama : Sheny Nur Kholifah
// NIM  :230441100048
// Kelas: pember c
// ASPRAK : KAK DEVI

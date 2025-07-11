import 'package:flutter/material.dart';
import 'dashboard.dart'; // Make sure this file exists in the same lib/ folder

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Dashboard(), // Replace with your dashboard
    );
  }
}

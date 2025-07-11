import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dashboard.dart'; // Your app's home page

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url:
        'https://ablywbfjrcybpskugzyf.supabase.co', // 🔁 Replace with your project URL
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFibHl3YmZqcmN5YnBza3VnenlmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTIyMjU5MTEsImV4cCI6MjA2NzgwMTkxMX0.SIS8DpjNVDx3C4gu3XnAXqi5-rJU0dEySWDsX8N5ERg', // 🔁 Replace with your anon key
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Dashboard(), // Your main app dashboard
    );
  }
}

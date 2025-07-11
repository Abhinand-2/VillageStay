import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url:
        'https://jpzxizfsbdxxythfylml.supabase.co', // 🔁 Replace with your Supabase project URL
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpwenhpemZzYmR4eHl0aGZ5bG1sIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTIyMTU2MTksImV4cCI6MjA2Nzc5MTYxOX0.Z9b5dOmgBfHQyjXcHgu8vlLKVNTgIijVRVZb1YHfruI', // 🔁 Replace with your public anon key
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AppRouter(),
    );
  }
}

import 'package:flutter/material.dart';

class TouristDashboardPage extends StatelessWidget {
  const TouristDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tourist Dashboard')),
      body: const Center(child: Text('Welcome to your Dashboard!')),
    );
  }
}

import 'package:flutter/material.dart';

class BookingPage extends StatelessWidget {
  final String title;
  final String location;

  const BookingPage({super.key, required this.title, required this.location});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Booking")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Experience: $title", style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            Text("Location: $location", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            const Text("Booking Form will go here..."),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TouristDashboardPage extends StatefulWidget {
  const TouristDashboardPage({super.key});

  @override
  State<TouristDashboardPage> createState() => _TouristDashboardPageState();
}

class _TouristDashboardPageState extends State<TouristDashboardPage> {
  final supabase = Supabase.instance.client;
  List<dynamic> bookings = [];
  bool isLoading = true;
  String? userId;

  @override
  void initState() {
    super.initState();
    fetchUserIdAndBookings();
  }

  Future<void> fetchUserIdAndBookings() async {
    final prefs = await SharedPreferences.getInstance();
    userId = prefs.getString('user_id');

    if (userId == null) {
      setState(() {
        isLoading = false;
      });
      return;
    }

    final response = await supabase
        .from('bookings')
        .select()
        .eq('user_id', userId!)
        .order('preferred_date', ascending: true);

    setState(() {
      bookings = response;
      isLoading = false;
    });
  }

  Widget _statusBadge(String status) {
    Color color;
    switch (status) {
      case 'confirmed':
        color = Colors.green;
        break;
      case 'rejected':
        color = Colors.red;
        break;
      default:
        color = Colors.orange;
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color),
      ),
      child: Text(
        status.toUpperCase(),
        style: TextStyle(color: color, fontWeight: FontWeight.w600),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Bookings'),
        backgroundColor: Colors.teal,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : bookings.isEmpty
          ? const Center(child: Text("No bookings yet."))
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: bookings.length,
              itemBuilder: (context, index) {
                final booking = bookings[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    title: Text(
                      booking['experience_name'] ?? 'Untitled',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Location: ${booking['region'] ?? '-'}"),
                        Text("Date: ${booking['preferred_date'] ?? '-'}"),
                        if (booking['message'] != null)
                          Text("Note: ${booking['message']}"),
                      ],
                    ),
                    trailing: _statusBadge(booking['status'] ?? 'pending'),
                  ),
                );
              },
            ),
    );
  }
}

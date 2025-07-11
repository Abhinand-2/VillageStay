import 'package:flutter/material.dart';

class MerchantDashboardPage extends StatelessWidget {
  const MerchantDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Merchant Dashboard'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.list), text: 'My Listings'),
              Tab(icon: Icon(Icons.add), text: 'Add Listing'),
              Tab(icon: Icon(Icons.book_online), text: 'Bookings'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [MyListingsTab(), AddListingTab(), BookingsReceivedTab()],
        ),
      ),
    );
  }
}

class MyListingsTab extends StatelessWidget {
  const MyListingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("List of your added experiences"));
  }
}

class AddListingTab extends StatelessWidget {
  const AddListingTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Form to add a new listing"));
  }
}

class BookingsReceivedTab extends StatelessWidget {
  const BookingsReceivedTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("All bookings received from tourists"));
  }
}

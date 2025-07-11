// import 'package:flutter/material.dart';

// class MerchantDashboardPage extends StatelessWidget {
//   const MerchantDashboardPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text("Merchant Dashboard"),
//           backgroundColor: Colors.teal,
//           bottom: const TabBar(
//             indicatorColor: Colors.white,
//             tabs: [
//               Tab(text: "My Listings"),
//               Tab(text: "Add Listing"),
//               Tab(text: "Bookings"),
//             ],
//           ),
//         ),
//         body: const TabBarView(
//           children: [MyListingsTab(), AddListingTab(), BookingsReceivedTab()],
//         ),
//       ),
//     );
//   }
// }

// // ✅ MyListingsTab
// class MyListingsTab extends StatelessWidget {
//   const MyListingsTab({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // [dummy data and widget code here...]
//   }
// }

// // ✅ AddListingTab
// class AddListingTab extends StatelessWidget {
//   const AddListingTab({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Center(child: Text('Add Listing Form Coming Soon...'));
//   }
// }

// // ✅ BookingsReceivedTab
// class BookingsReceivedTab extends StatelessWidget {
//   const BookingsReceivedTab({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // [dummy data and widget code here...]
//   }
// }

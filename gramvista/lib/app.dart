// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart';
// import 'package:gramvista/features/booking/pages/booking_page.dart';

// class ExplorePage extends StatefulWidget {
//   const ExplorePage({super.key});

//   @override
//   State<ExplorePage> createState() => _ExplorePageState();
// }

// class _ExplorePageState extends State<ExplorePage> {
//   final List<String> themes = [
//     'All',
//     'Eco-tourism',
//     'Crafts',
//     'Cultural',
//     'Nature',
//     'Food',
//     'Adventure',
//   ];
//   final List<String> locations = [
//     'All',
//     'Wayanad',
//     'Kochi',
//     'Alappuzha',
//     'Kovalam',
//     'Thekkady',
//   ];

//   String searchQuery = '';
//   String selectedTheme = 'All';
//   String selectedLocation = 'All';

//   final List<Map<String, dynamic>> keralaListings = [
//     {
//       'title': 'Backwater Canoe Ride',
//       'location': 'Alappuzha',
//       'theme': 'Nature',
//       'latlng': LatLng(9.4981, 76.3388),
//     },
//     {
//       'title': 'Hill Farm Homestay',
//       'location': 'Wayanad',
//       'theme': 'Eco-tourism',
//       'latlng': LatLng(11.6854, 76.1310),
//     },
//     {
//       'title': 'Beachside Handicrafts',
//       'location': 'Kovalam',
//       'theme': 'Crafts',
//       'latlng': LatLng(8.4029, 76.9780),
//     },
//     {
//       'title': 'Kathakali Performance',
//       'location': 'Kochi',
//       'theme': 'Cultural',
//       'latlng': LatLng(9.9312, 76.2673),
//     },
//   ];

//   List<Map<String, dynamic>> get filteredListings {
//     return keralaListings.where((listing) {
//       final matchesSearch =
//           searchQuery.isEmpty ||
//           listing['title'].toLowerCase().contains(searchQuery.toLowerCase());
//       final matchesTheme =
//           selectedTheme == 'All' || listing['theme'] == selectedTheme;
//       final matchesLocation =
//           selectedLocation == 'All' || listing['location'] == selectedLocation;
//       return matchesSearch && matchesTheme && matchesLocation;
//     }).toList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Explore Kerala'),
//         backgroundColor: Colors.teal,
//         actions: const [
//           Padding(
//             padding: EdgeInsets.only(right: 16),
//             child: Icon(Icons.filter_list_alt), // filter icon
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           const SizedBox(height: 10),

//           // 🔍 Search Bar
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16.0),
//             child: TextField(
//               decoration: const InputDecoration(
//                 hintText: 'Search listings...',
//                 prefixIcon: Icon(Icons.search),
//                 border: OutlineInputBorder(),
//               ),
//               onChanged: (val) {
//                 setState(() => searchQuery = val);
//               },
//             ),
//           ),

//           const SizedBox(height: 10),

//           // 🧩 Dropdown Filters
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16.0),
//             child: Row(
//               children: [
//                 // 🎨 Theme Filter
//                 Expanded(
//                   child: DropdownButtonFormField<String>(
//                     decoration: const InputDecoration(
//                       labelText: 'Theme',
//                       prefixIcon: Icon(Icons.category),
//                       border: OutlineInputBorder(),
//                     ),
//                     value: selectedTheme,
//                     items: themes
//                         .map(
//                           (theme) => DropdownMenuItem(
//                             value: theme,
//                             child: Text(theme),
//                           ),
//                         )
//                         .toList(),
//                     onChanged: (val) =>
//                         setState(() => selectedTheme = val ?? 'All'),
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 // 📍 Location Filter
//                 Expanded(
//                   child: DropdownButtonFormField<String>(
//                     decoration: const InputDecoration(
//                       labelText: 'Location',
//                       prefixIcon: Icon(Icons.location_on),
//                       border: OutlineInputBorder(),
//                     ),
//                     value: selectedLocation,
//                     items: locations
//                         .map(
//                           (loc) =>
//                               DropdownMenuItem(value: loc, child: Text(loc)),
//                         )
//                         .toList(),
//                     onChanged: (val) =>
//                         setState(() => selectedLocation = val ?? 'All'),
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           const SizedBox(height: 10),

//           // 🗺️ Map Section
//           Expanded(
//             flex: 2,
//             child: Padding(
//               padding: const EdgeInsets.all(8),
//               child: FlutterMap(
//                 options: MapOptions(
//                   center: LatLng(10.8505, 76.2711),
//                   zoom: 7.5,
//                 ),
//                 children: [
//                   TileLayer(
//                     urlTemplate:
//                         'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
//                     subdomains: const ['a', 'b', 'c'],
//                   ),
//                   MarkerLayer(
//                     markers: filteredListings.map((item) {
//                       return Marker(
//                         width: 80.0,
//                         height: 80.0,
//                         point: item['latlng'],
//                         child: Tooltip(
//                           message: item['title'],
//                           child: const Icon(
//                             Icons.location_pin,
//                             color: Colors.red,
//                             size: 30,
//                           ),
//                         ),
//                       );
//                     }).toList(),
//                   ),
//                 ],
//               ),
//             ),
//           ),

//           const Divider(height: 0),

//           // 📋 List Below Map
//           Expanded(
//             flex: 3,
//             child: filteredListings.isEmpty
//                 ? const Center(child: Text('No listings match your criteria.'))
//                 : ListView.builder(
//                     itemCount: filteredListings.length,
//                     itemBuilder: (context, index) {
//                       final item = filteredListings[index];
//                       return ListTile(
//                         leading: const Icon(Icons.place, color: Colors.teal),
//                         title: Text(item['title']),
//                         subtitle: Text(
//                           '${item['location']} • ${item['theme']}',
//                         ),
//                         trailing: ElevatedButton(
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (_) => BookingPage(
//                                   title: item['title'],
//                                   location: item['location'],
//                                 ),
//                               ),
//                             );
//                           },
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.teal,
//                           ),
//                           child: const Text('Book'),
//                         ),
//                       );
//                     },
//                   ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/auth/pages/login_page.dart';
import 'features/home/pages/explore_page.dart';
import 'features/merchant_dashboard/pages/merchant_dashboard_page.dart';
//import 'features/admin/pages/admin_panel.dart';
import 'features/tourist/pages/tourist_main_page.dart';

class AppRouter extends StatefulWidget {
  const AppRouter({super.key});

  @override
  State<AppRouter> createState() => _AppRouterState();
}

class _AppRouterState extends State<AppRouter> {
  String? role;
  String? userId;

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  Future<void> loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      role = prefs.getString('role');
      userId = prefs.getString('user_id');
    });
  }

  @override
  Widget build(BuildContext context) {
    if (role == null || userId == null) {
      return const LoginPage();
    }

    switch (role) {
      case 'tourist':
        return const TouristMainPage(); // instead of ExplorePage or Dashboard directly
      case 'merchant':
        return const MerchantDashboardPage();
      // case 'admin':
      //   return const AdminPanelPage();
      default:
        return const LoginPage();
    }
  }
}

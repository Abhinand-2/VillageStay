import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:gramvista/booking.dart'; // Ensure this path is correct

class ExplorePage extends StatelessWidget {
  ExplorePage({super.key});

  final List<Map<String, dynamic>> keralaListings = [
    {
      'title': 'Backwater Canoe Ride',
      'location': 'Alappuzha',
      'latlng': LatLng(9.4981, 76.3388),
    },
    {
      'title': 'Hill Farm Homestay',
      'location': 'Wayanad',
      'latlng': LatLng(11.6854, 76.1310),
    },
    {
      'title': 'Beachside Handicrafts',
      'location': 'Kovalam',
      'latlng': LatLng(8.4029, 76.9780),
    },
    {
      'title': 'Kathakali Performance',
      'location': 'Kochi',
      'latlng': LatLng(9.9312, 76.2673),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore Kerala'),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          const SizedBox(height: 12),
          const Text(
            'Explore Authentic Kerala Experiences',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.teal,
            ),
          ),
          const SizedBox(height: 10),

          // 🗺️ Map View
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: FlutterMap(
                options: MapOptions(
                  center: LatLng(10.8505, 76.2711), // Center of Kerala
                  zoom: 7.4,
                ),
                children: [
                  TileLayer(
                    urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                    subdomains: const ['a', 'b', 'c'],
                  ),
                  MarkerLayer(
                    markers: keralaListings.map((item) {
                      return Marker(
                        width: 50.0,
                        height: 50.0,
                        point: item['latlng'],
                        child: Tooltip(
                          message: '${item['title']} — ${item['location']}',
                          child: const Icon(
                            Icons.location_on,
                            color: Colors.teal,
                            size: 36,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 10),

          // 📋 List of Listings
          Expanded(
            flex: 2,
            child: ListView.builder(
              itemCount: keralaListings.length,
              itemBuilder: (context, index) {
                final item = keralaListings[index];
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.place, color: Colors.teal),
                    title: Text(item['title']),
                    subtitle: Text(item['location']),
                    trailing: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const BookNowPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                      ),
                      child: const Text('Book'),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

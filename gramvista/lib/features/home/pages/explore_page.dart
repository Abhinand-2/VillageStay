// import 'package:flutter/material.dart';

// class ExplorePage extends StatefulWidget {
//   const ExplorePage({super.key});

//   @override
//   State<ExplorePage> createState() => _ExplorePageState();
// }

// class _ExplorePageState extends State<ExplorePage> {
//   String selectedTheme = '';
//   String selectedRegion = '';
//   List<String> selectedTags = [];

//   final List<String> themes = ['Food', 'Textile', 'Tourist Spot', 'Craft'];
//   final List<String> tags = ['Eco-Friendly', 'Women-Led', 'Authentic'];

//   final List<Map<String, dynamic>> dummyListings = [
//     {
//       'name': 'Organic Farm Visit',
//       'description': 'Experience traditional organic farming.',
//       'theme': 'Food',
//       'region': 'Wayanad',
//       'tags': ['Eco-Friendly'],
//       'price': '₹600',
//     },
//     {
//       'name': 'Weaving Workshop',
//       'description': 'Learn handloom weaving techniques.',
//       'theme': 'Textile',
//       'region': 'Kanchipuram',
//       'tags': ['Women-Led', 'Authentic'],
//       'price': 'Free',
//     },
//     {
//       'name': 'Village Heritage Walk',
//       'description': 'Walk through a preserved tribal village.',
//       'theme': 'Tourist Spot',
//       'region': 'Nagaland',
//       'tags': ['Authentic'],
//       'price': '₹400',
//     },
//   ];

//   List<Map<String, dynamic>> get filteredListings {
//     return dummyListings.where((listing) {
//       final matchesTheme =
//           selectedTheme.isEmpty || listing['theme'] == selectedTheme;
//       final matchesRegion =
//           selectedRegion.isEmpty ||
//           listing['region'].toLowerCase().contains(
//             selectedRegion.toLowerCase(),
//           );
//       final matchesTags = selectedTags.every(
//         (tag) => listing['tags'].contains(tag),
//       );
//       return matchesTheme && matchesRegion && matchesTags;
//     }).toList();
//   }

//   void toggleTag(String tag) {
//     setState(() {
//       selectedTags.contains(tag)
//           ? selectedTags.remove(tag)
//           : selectedTags.add(tag);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Explore Experiences'),
//         backgroundColor: Colors.teal,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(12),
//         child: Column(
//           children: [
//             DropdownButtonFormField<String>(
//               decoration: const InputDecoration(labelText: 'Theme'),
//               items: themes.map((theme) {
//                 return DropdownMenuItem(value: theme, child: Text(theme));
//               }).toList(),
//               onChanged: (val) => setState(() => selectedTheme = val ?? ''),
//             ),
//             const SizedBox(height: 10),
//             TextField(
//               decoration: const InputDecoration(
//                 labelText: 'Region',
//                 border: OutlineInputBorder(),
//               ),
//               onChanged: (val) => setState(() => selectedRegion = val),
//             ),
//             const SizedBox(height: 10),
//             Wrap(
//               spacing: 8,
//               children: tags.map((tag) {
//                 final isSelected = selectedTags.contains(tag);
//                 return FilterChip(
//                   label: Text(tag),
//                   selected: isSelected,
//                   onSelected: (_) => toggleTag(tag),
//                   selectedColor: Colors.teal.shade200,
//                 );
//               }).toList(),
//             ),
//             const SizedBox(height: 16),
//             Expanded(
//               child: filteredListings.isEmpty
//                   ? const Center(
//                       child: Text('No listings match your criteria.'),
//                     )
//                   : ListView.builder(
//                       itemCount: filteredListings.length,
//                       itemBuilder: (context, index) {
//                         final listing = filteredListings[index];
//                         return Card(
//                           margin: const EdgeInsets.symmetric(vertical: 8),
//                           child: ListTile(
//                             title: Text(listing['name']),
//                             subtitle: Text(
//                               '${listing['theme']} • ${listing['region']}',
//                             ),
//                             trailing: Text(listing['price']),
//                           ),
//                         );
//                       },
//                     ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  String selectedTheme = '';
  String location = '';
  List<String> selectedFilters = [];

  final List<String> themes = [
    'Food',
    'Textile',
    'Tourist Spot',
    'Handicrafts',
  ];
  final List<String> filters = ['Women-led', 'Eco-friendly', 'Authentic'];

  final List<Map<String, dynamic>> listings = [
    {
      'title': 'Organic Farm Day',
      'theme': 'Food',
      'location': 'Wayanad',
      'filters': ['Eco-friendly', 'Authentic'],
      'requiresBooking': true,
      'image':
          'https://images.unsplash.com/photo-1525966222134-fcfa99b8ae77?auto=format&fit=crop&w=800&q=60',
    },
    {
      'title': 'Textile Weaving Workshop',
      'theme': 'Textile',
      'location': 'Kanchipuram',
      'filters': ['Women-led'],
      'requiresBooking': false,
      'image':
          'https://images.unsplash.com/photo-1589987607627-0adf8b1cbfd1?auto=format&fit=crop&w=800&q=60',
    },
    {
      'title': 'Tribal Cultural Tour',
      'theme': 'Tourist Spot',
      'location': 'Nagaland',
      'filters': ['Eco-friendly'],
      'requiresBooking': true,
      'image':
          'https://images.unsplash.com/photo-1600788913927-dc114cb9efc3?auto=format&fit=crop&w=800&q=60',
    },
    {
      'title': 'Handicraft Showcase',
      'theme': 'Handicrafts',
      'location': 'Rajasthan',
      'filters': ['Authentic'],
      'requiresBooking': false,
      'image':
          'https://images.unsplash.com/photo-1606813902794-4816c99f51e4?auto=format&fit=crop&w=800&q=60',
    },
  ];

  List<Map<String, dynamic>> get filteredListings {
    return listings.where((listing) {
      final matchesTheme =
          selectedTheme.isEmpty ||
          listing['theme'].toLowerCase() == selectedTheme.toLowerCase();
      final matchesLocation =
          location.isEmpty ||
          listing['location'].toLowerCase().contains(location.toLowerCase());
      final matchesFilters = selectedFilters.every(
        (filter) => listing['filters'].contains(filter),
      );
      return matchesTheme && matchesLocation && matchesFilters;
    }).toList();
  }

  void toggleFilter(String filter) {
    setState(() {
      selectedFilters.contains(filter)
          ? selectedFilters.remove(filter)
          : selectedFilters.add(filter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        title: const Text('Explore Rural India'),
        backgroundColor: const Color(0xFF059669),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Filters
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: selectedTheme.isNotEmpty ? selectedTheme : null,
                    hint: const Text('Theme'),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                      ),
                    ),
                    items: themes.map((theme) {
                      return DropdownMenuItem(value: theme, child: Text(theme));
                    }).toList(),
                    onChanged: (val) => setState(() {
                      selectedTheme = val ?? '';
                    }),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Location',
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: const Icon(Icons.location_on),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onChanged: (val) => setState(() => location = val),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Tag Filters
            Wrap(
              spacing: 8,
              children: filters.map((filter) {
                return FilterChip(
                  label: Text(filter),
                  selected: selectedFilters.contains(filter),
                  onSelected: (_) => toggleFilter(filter),
                  selectedColor: Colors.teal.shade100,
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            // Listings
            Expanded(
              child: filteredListings.isEmpty
                  ? const Center(child: Text('No experiences match filters.'))
                  : ListView.builder(
                      itemCount: filteredListings.length,
                      itemBuilder: (context, index) {
                        final listing = filteredListings[index];
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          elevation: 4,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(16),
                                ),
                                child: Image.network(
                                  listing['image'],
                                  width: double.infinity,
                                  height: 180,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      listing['title'],
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      '${listing['theme']} • ${listing['location']}',
                                      style: TextStyle(color: Colors.grey[700]),
                                    ),
                                    const SizedBox(height: 10),
                                    Wrap(
                                      spacing: 6,
                                      children: (listing['filters'] as List)
                                          .map(
                                            (tag) => Chip(
                                              label: Text(tag),
                                              backgroundColor:
                                                  Colors.teal.shade50,
                                            ),
                                          )
                                          .toList(),
                                    ),
                                    const SizedBox(height: 12),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: listing['requiresBooking']
                                          ? ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: const Color(
                                                  0xFF10B981,
                                                ),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                              ),
                                              onPressed: () {
                                                ScaffoldMessenger.of(
                                                  context,
                                                ).showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Booking ${listing['title']}...',
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: const Text('Book Now'),
                                            )
                                          : const Text(
                                              'Free Entry',
                                              style: TextStyle(
                                                fontStyle: FontStyle.italic,
                                                color: Colors.black87,
                                              ),
                                            ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

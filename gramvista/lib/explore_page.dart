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
      'title': 'Organic Food Trail',
      'theme': 'Food',
      'location': 'Wayanad',
      'filters': ['Eco-friendly', 'Authentic'],
      'requiresBooking': true,
    },
    {
      'title': 'Traditional Weaving Workshop',
      'theme': 'Textile',
      'location': 'Kanchipuram',
      'filters': ['Women-led', 'Authentic'],
      'requiresBooking': false,
    },
    {
      'title': 'Cultural Village Tour',
      'theme': 'Tourist Spot',
      'location': 'Nagaland',
      'filters': ['Eco-friendly'],
      'requiresBooking': true,
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
      if (selectedFilters.contains(filter)) {
        selectedFilters.remove(filter);
      } else {
        selectedFilters.add(filter);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(labelText: 'Select Theme'),
            items: themes.map((theme) {
              return DropdownMenuItem(value: theme, child: Text(theme));
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedTheme = value ?? '';
              });
            },
          ),
          const SizedBox(height: 10),

          TextField(
            decoration: const InputDecoration(
              labelText: 'Enter Location',
              border: OutlineInputBorder(),
            ),
            onChanged: (val) => setState(() => location = val),
          ),
          const SizedBox(height: 10),

          Wrap(
            spacing: 8,
            children: filters.map((filter) {
              final isSelected = selectedFilters.contains(filter);
              return FilterChip(
                label: Text(filter),
                selected: isSelected,
                onSelected: (_) => toggleFilter(filter),
                selectedColor: Colors.teal.shade200,
              );
            }).toList(),
          ),
          const SizedBox(height: 20),

          Expanded(
            child: filteredListings.isEmpty
                ? const Center(child: Text('No matching listings found.'))
                : ListView.builder(
                    itemCount: filteredListings.length,
                    itemBuilder: (context, index) {
                      final listing = filteredListings[index];
                      return Card(
                        elevation: 3,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
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
                              const SizedBox(height: 4),
                              Text(
                                '${listing['theme']} • ${listing['location']}',
                                style: TextStyle(color: Colors.grey[700]),
                              ),
                              const SizedBox(height: 8),
                              Wrap(
                                spacing: 6,
                                children: listing['filters']
                                    .map<Widget>(
                                      (tag) => Chip(
                                        label: Text(tag),
                                        backgroundColor: Colors.teal.shade50,
                                      ),
                                    )
                                    .toList(),
                              ),
                              const SizedBox(height: 10),
                              Align(
                                alignment: Alignment.centerRight,
                                child: listing['requiresBooking']
                                    ? ElevatedButton(
                                        onPressed: () {
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Booking for ${listing['title']}...',
                                              ),
                                            ),
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.teal,
                                        ),
                                        child: const Text('Book Now'),
                                      )
                                    : const Text(
                                        'Free Entry',
                                        style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                              ),
                            ],
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

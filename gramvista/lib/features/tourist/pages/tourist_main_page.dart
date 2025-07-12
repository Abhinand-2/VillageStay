// lib/features/tourist/pages/tourist_main_page.dart

import 'package:flutter/material.dart';
import '../../home/pages/explore_page.dart';
import '../../tourist_dashboard/pages/tourist_dashboard_page.dart';

class TouristMainPage extends StatefulWidget {
  const TouristMainPage({super.key});

  @override
  State<TouristMainPage> createState() => _TouristMainPageState();
}

class _TouristMainPageState extends State<TouristMainPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [ExplorePage(), TouristDashboardPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
        ],
      ),
    );
  }
}

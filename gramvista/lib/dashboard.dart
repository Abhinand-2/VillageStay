import 'package:flutter/material.dart';
import 'explore_page.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    ExplorePage(),
    TrendingPage(),
    AuthPage(),
    SupportPage(),
  ];

  final List<String> _titles = [
    'Explore',
    'Trending',
    'Login/Register',
    'Support',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_currentIndex]),
        backgroundColor: Colors.teal,
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() => _currentIndex = index);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Explore'),
          BottomNavigationBarItem(
            icon: Icon(Icons.trending_up),
            label: 'Trending',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.login), label: 'Login'),
          BottomNavigationBarItem(
            icon: Icon(Icons.support_agent),
            label: 'Support',
          ),
        ],
      ),
    );
  }
}

// Keep these temporary placeholders for now
class TrendingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Top tourist spots & spotlight listings.'));
  }
}

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Login/Register screen here.'));
  }
}

class SupportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Contact & feedback form here.'));
  }
}

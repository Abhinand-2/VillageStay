// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../../home/pages/explore_page.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   String role = 'tourist';
//   final TextEditingController _userIdController = TextEditingController();

//   Future<void> _login() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString('role', role);
//     await prefs.setString('user_id', _userIdController.text);

//     // Restart app state
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (_) => const ExplorePage()),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('VillageStay Login')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _userIdController,
//               decoration: const InputDecoration(
//                 labelText: 'Enter Dummy User ID',
//               ),
//             ),
//             const SizedBox(height: 20),
//             DropdownButtonFormField<String>(
//               value: role,
//               decoration: const InputDecoration(labelText: 'Select Role'),
//               items: ['tourist', 'merchant', 'admin'].map((r) {
//                 return DropdownMenuItem(value: r, child: Text(r));
//               }).toList(),
//               onChanged: (val) {
//                 if (val != null) setState(() => role = val);
//               },
//             ),
//             const SizedBox(height: 30),
//             ElevatedButton(onPressed: _login, child: const Text('Login')),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../home/pages/explore_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String role = 'tourist';
  final TextEditingController _userIdController = TextEditingController();

  Future<void> _login() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('role', role);
    await prefs.setString('user_id', _userIdController.text);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => ExplorePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header Image
              // ClipRRect(
              //   borderRadius: BorderRadius.circular(12),
              //   child: Image.network(
              //     'https://source.unsplash.com/800x400/?india,village,travel',
              //     height: 200,
              //     fit: BoxFit.cover,
              //   ),
              // ),
              // const SizedBox(height: 24),
              const Text(
                'Welcome to VillageStay',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF065F46),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Discover rural India. Login to continue.',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 32),

              TextField(
                controller: _userIdController,
                decoration: InputDecoration(
                  labelText: 'Enter User ID',
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20),

              DropdownButtonFormField<String>(
                value: role,
                decoration: InputDecoration(
                  labelText: 'Select Role',
                  prefixIcon: const Icon(Icons.people),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                items: const [
                  DropdownMenuItem(value: 'tourist', child: Text('Tourist')),
                  DropdownMenuItem(value: 'merchant', child: Text('Merchant')),
                  DropdownMenuItem(value: 'admin', child: Text('Admin')),
                ],
                onChanged: (val) {
                  if (val != null) setState(() => role = val);
                },
              ),
              const SizedBox(height: 30),

              ElevatedButton.icon(
                onPressed: _login,
                icon: const Icon(Icons.login),
                label: const Text(
                  'Login & Explore',
                  style: TextStyle(fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF059669),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              const Center(
                child: Text(
                  'Powered by Village Communities 🏡',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

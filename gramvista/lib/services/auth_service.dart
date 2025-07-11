import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  String role = 'tourist';
  bool isPhone = true;
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false;
  final supabase = Supabase.instance.client;

  void showSnackbar(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> handlePhoneLogin() async {
    setState(() => isLoading = true);
    final phone = phoneController.text.trim();

    if (!phone.startsWith('+')) {
      showSnackbar('Please enter phone with country code, e.g. +91...');
      setState(() => isLoading = false);
      return;
    }

    final res = await supabase.auth.signInWithOtp(phone: phone);
    showSnackbar("OTP sent to $phone");
    setState(() => isLoading = false);
  }

  Future<void> handleEmailSignup() async {
    setState(() => isLoading = true);
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    try {
      final res = await supabase.auth.signUp(email: email, password: password);
      final userId = res.user?.id;

      if (userId != null) {
        await supabase.from('users').insert({
          'id': userId,
          'email': email,
          'role': role,
        });
      }

      showSnackbar('Signup successful! Check your email to confirm.');
    } catch (e) {
      showSnackbar('Signup error: $e');
    }

    setState(() => isLoading = false);
  }

  Future<void> handleEmailLogin() async {
    setState(() => isLoading = true);
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    try {
      await supabase.auth.signInWithPassword(email: email, password: password);
      showSnackbar('Login successful');
    } catch (e) {
      showSnackbar('Login failed: $e');
    }

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login / Signup'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Text('Choose your role:', style: TextStyle(fontSize: 16)),
            DropdownButton<String>(
              value: role,
              items: ['tourist', 'merchant', 'ngo', 'admin'].map((r) {
                return DropdownMenuItem(value: r, child: Text(r));
              }).toList(),
              onChanged: (val) => setState(() => role = val!),
            ),
            const SizedBox(height: 20),

            SwitchListTile(
              title: const Text('Use Phone OTP (for tourist only)'),
              value: isPhone,
              onChanged: (val) => setState(() => isPhone = val),
            ),
            const SizedBox(height: 10),

            if (isPhone)
              Column(
                children: [
                  TextField(
                    controller: phoneController,
                    decoration: const InputDecoration(
                      labelText: 'Phone Number (+91...)',
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: isLoading ? null : handlePhoneLogin,
                    child: const Text('Send OTP'),
                  ),
                ],
              )
            else
              Column(
                children: [
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: passwordController,
                    decoration: const InputDecoration(labelText: 'Password'),
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: isLoading ? null : handleEmailLogin,
                    child: const Text('Login'),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: isLoading ? null : handleEmailSignup,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: const Text('Signup'),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

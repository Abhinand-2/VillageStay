// TODO Implement this library.import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileSettingsPage extends StatefulWidget {
  const ProfileSettingsPage({super.key});
  @override
  State<ProfileSettingsPage> createState() => _ProfileSettingsPageState();
}

class _ProfileSettingsPageState extends State<ProfileSettingsPage> {
  final supabase = Supabase.instance.client;
  final _fullName = TextEditingController();
  final _phone = TextEditingController();
  final _region = TextEditingController();

  bool _loading = true;
  String? authId;

  Future<void> _load() async {
    final session = supabase.auth.currentSession;
    authId = session?.user.id;
    final res = await supabase
        .from('users')
        .select('full_name,phone_number,region')
        .eq('auth_id', authId)
        .single();
    final data = res.data;
    if (data != null) {
      _fullName.text = data['full_name'];
      _phone.text = data['phone_number'];
      _region.text = data['region'];
    }
    setState(() => _loading = false);
  }

  Future<void> _save() async {
    setState(() => _loading = true);
    await supabase.from('users').update({
      'full_name': _fullName.text.trim(),
      'phone_number': _phone.text.trim(),
      'region': _region.text.trim(),
    }).eq('auth_id', authId);
    setState(() => _loading = false);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Saved')));
  }

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    _fullName.dispose();
    _phone.dispose();
    _region.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile Settings')),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  TextField(controller: _fullName, decoration: const InputDecoration(labelText: 'Full Name')),
                  const SizedBox(height: 12),
                  TextField(controller: _phone, decoration: const InputDecoration(labelText: 'Phone Number')),
                  const SizedBox(height: 12),
                  TextField(controller: _region, decoration: const InputDecoration(labelText: 'Region')),
                  const SizedBox(height: 20),
                  ElevatedButton(onPressed: _save, child: const Text('Save Changes')),
                ],
              ),
            ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MarketplacePage extends StatefulWidget {
  const MarketplacePage({super.key});
  @override
  State<MarketplacePage> createState() => _MarketplacePageState();
}

class _MarketplacePageState extends State<MarketplacePage> {
  final supabase = Supabase.instance.client;
  List submissions = [];
  bool _loading = true;

  Future<void> _load() async {
    final user = supabase.auth.currentUser;
    if (user == null) return;
    final res = await supabase
        .from('community_submissions')
        .select('*')
        .eq('user_id', user.id);
    submissions = res.data ?? [];
    setState(() => _loading = false);
  }

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Marketplace Listings')),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: submissions.length,
              itemBuilder: (_, i) {
                final s = submissions[i];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    title: Text(s['name']),
                    subtitle: Text('Status: ${s['status']}'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      // Optionally route to detail or edit
                    },
                  ),
                );
              },
            ),
    );
  }
}

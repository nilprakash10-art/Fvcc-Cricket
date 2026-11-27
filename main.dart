import 'package:flutter/material.dart';

void main() => runApp(const FVCCApp());

const navy = Color(0xFF123B70);
const blue = Color(0xFF2366A8);

class FVCCApp extends StatelessWidget {
  const FVCCApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FVCC Cricket',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: blue),
        scaffoldBackgroundColor: const Color(0xFFF5F8FC),
        appBarTheme: const AppBarTheme(
          backgroundColor: navy, foregroundColor: Colors.white,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = <(String, IconData)>[
      ('Player Registration', Icons.person_add_alt_1),
      ('Team Management', Icons.groups),
      ('Match Scoring', Icons.sports_cricket),
      ('Tournament Organization', Icons.emoji_events),
      ('Reports & Statistics', Icons.bar_chart),
      ('Admin & Scorer Access', Icons.admin_panel_settings),
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('FVCC Cricket')),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          Card(
            elevation: 1,
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(children: [
                Image.asset('assets/fvcc_logo.png', height: 150, fit: BoxFit.contain),
                const SizedBox(height: 12),
                const Text('FORTVIEW CRICKET CLUB',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: navy)),
                const Text('FVCC • Est. 2008', style: TextStyle(color: Colors.black54)),
                const SizedBox(height: 8),
                const Text('Cricket scoring and club management',
                  textAlign: TextAlign.center),
              ]),
            ),
          ),
          const SizedBox(height: 18),
          const Text('Club Dashboard',
            style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold, color: navy)),
          const SizedBox(height: 10),
          for (final item in items)
            Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: const Color(0xFFE5EEF8),
                  child: Icon(item.$2, color: navy),
                ),
                title: Text(item.$1, style: const TextStyle(fontWeight: FontWeight.w600)),
                subtitle: const Text('Module preview — setup required'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => ModulePage(title: item.$1, icon: item.$2))),
              ),
            ),
          const SizedBox(height: 12),
          const Text(
            'Prototype only: accounts, cloud database, live scoring, tournament calculations and data sync are not connected yet.',
            style: TextStyle(color: Colors.black54, fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class ModulePage extends StatelessWidget {
  final String title;
  final IconData icon;
  const ModulePage({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(title)),
    body: Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Icon(icon, size: 58, color: blue),
          const SizedBox(height: 16),
          Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text('This module is planned for the FVCC app. Its working features will be added in the next development stage.',
            textAlign: TextAlign.center),
        ]),
      ),
    ),
  );
}

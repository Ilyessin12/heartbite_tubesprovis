import 'package:flutter/material.dart';
import 'welcome_pages/welcome.dart';
import 'welcome_pages/welcome1.dart';
import 'welcome_pages/welcome2.dart';
import 'welcome_pages/welcome3.dart';
import 'setup_pages/setupallergies.dart';
import 'setup_pages/setupdiets.dart';
import 'setup_pages/setupaccount.dart';
import 'setup_pages/finishsetup.dart';
// Import other pages here
// import 'pages/another.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HeartBite',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
      ),
      home: const NavigationPage(),
    );
  }
}

class PageItem {
  final String title;
  final Widget page;

  PageItem(this.title, this.page);
}

class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Daftar tombol dan halaman yang ingin dituju
    final List<PageItem> pages = [
      PageItem('Welcome Screen', const WelcomeScreen()),
      PageItem('Welcome 1 Screen', const Welcome1Screen()),
      PageItem('Welcome 2 Screen', const Welcome2Screen()),
      PageItem('Welcome 3 Screen', const Welcome3Screen()),
      PageItem('Setup Allergies', const SetupAllergiesPage()),
      PageItem('Setup Diets', const SetupDietsPage()),
      PageItem('Setup Account', const SetupAccountPage()),
      PageItem('finish Setup', const FinishSetupScreen()),
      // Tambah halaman lain di sini
      // PageItem('Another Page', const AnotherPage()),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: ListView.separated(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          itemCount: pages.length,
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            return ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => pages[index].page),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                minimumSize: const Size(200, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text('Go to ${pages[index].title}'),
            );
          },
        ),
      ),
    );
  }
}

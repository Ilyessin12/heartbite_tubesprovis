// import packages from flutter
import 'package:flutter/material.dart';
//========= import welcome pages
import 'welcome_pages/welcome.dart';
import 'welcome_pages/welcome1.dart';
import 'welcome_pages/welcome2.dart';
import 'welcome_pages/welcome3.dart';
//======== import setup pages
import 'setup_pages/setupallergies.dart';
import 'setup_pages/setupdiets.dart';
import 'setup_pages/setupaccount.dart';
import 'setup_pages/finishsetup.dart';
//===== import notification pages
import 'notification_pages/empty_notification.dart';
import 'notification_pages/notification.dart';
//===== import bookmark pages
import 'bookmark/bookmark.dart';
import 'bookmark/bookmark-create.dart';
import 'bookmark/bookmark-detail.dart';
import 'bookmark/bookmark-edit.dart';
//===== import homepage pages
import 'homepage/homepage.dart';
import 'homepage/homepage-detail.dart';

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
      // welcome pages
      PageItem('Welcome Screen', const WelcomeScreen()),
      PageItem('Welcome 1 Screen', const Welcome1Screen()),
      PageItem('Welcome 2 Screen', const Welcome2Screen()),
      PageItem('Welcome 3 Screen', const Welcome3Screen()),
      //setup pages
      PageItem('Setup Allergies', const SetupAllergiesPage()),
      PageItem('Setup Diets', const SetupDietsPage()),
      PageItem('Setup Account', const SetupAccountPage()),
      PageItem('Finish Setup', const FinishSetupScreen()),
      //notification pages
      PageItem('Empty Notification', const EmptyNotificationPage()),
      PageItem('Notification', const NotificationPage()),
      //bookmark pages
      PageItem('Bookmark', const BookmarkScreen()),
      PageItem('Bookmark Create', const BookmarkCreateScreen()),
      //TODO: Betulin detail ama edit bookmark
      //PageItem('Bookmark Detail', const BookmarkDetailScreen()), 
      //PageItem('Bookmark Edit', const BookmarkEditScreen()),

      //homepage pages
      PageItem('Home Page', const HomePage()),
      //TODO: Betulin homepage-detail Screen
      //PageItem('Home Page Detail', const HomePageDetailScreen()),


      //++++++++++++++++++++ CONTOH PEMAKAIAN ++++++++++++++++++++++
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

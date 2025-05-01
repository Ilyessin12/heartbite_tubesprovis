// material import
import 'package:flutter/material.dart';

// Import the routes file
import 'routes.dart';

// Import other page files (Keep existing imports if needed, or remove if pages are replaced)
// Example: import 'pages/homepage.dart'; // You'll add actual page imports later

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Heartbite App', // Updated title
      debugShowCheckedModeBanner: false,
      // Use named routes
      initialRoute: '/', // Define the initial route if needed, or keep home
      home: const HomeScreen(), // Or set initialRoute to AppRoutes.welcome perhaps?
      onGenerateRoute: AppRoutes.generateRoute, // Use the route generator
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Track hover state for each button
  final Map<String, bool> _isHovering = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Updated AppBar title
        title: const Text('Heartbite Navigation'),
        backgroundColor: const Color(0xFF41DDB9),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'No Kelompok: 23', // Keep this if needed
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16), // Increased spacing

            // Center-aligned navigation buttons
            Center(
              child: Column(
                children: [
                  _buildBubble('Login', routeName: AppRoutes.login),
                  _buildBubble('Detail Resep', routeName: AppRoutes.detailResep),
                  _buildBubble('Bookmark', routeName: AppRoutes.bookmark),
                  _buildBubble('Homepage', routeName: AppRoutes.homepage),
                  _buildBubble('Account Setup', routeName: AppRoutes.accountSetup),
                  // --- Sidebar Section ---
                  const SizedBox(height: 10), // Add space before sidebar items
                  const Text("Sidebar:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0), // Indent sidebar items
                    child: Column(
                      children: [
                        _buildBubble('Profile', routeName: AppRoutes.profile, width: 230), // Slightly smaller width
                        _buildBubble('Settings', routeName: AppRoutes.appSettings, width: 230),
                        _buildBubble('About', routeName: AppRoutes.about, width: 230),
                      ],
                    ),
                  ),
                   const SizedBox(height: 10), // Add space after sidebar items
                  // --- End Sidebar Section ---
                  _buildBubble('Welcome Page', routeName: AppRoutes.welcome),
                  _buildBubble('Tambah Resep', routeName: AppRoutes.tambahResep),
                  _buildBubble('Notifikasi', routeName: AppRoutes.notifikasi),
                ],
              ),
            ),

            // Remove the old 'Transaksi' section
            // const SizedBox(height: 24),
            // Container(...)
          ],
        ),
      ),
    );
  }

  /// Updated helper to build rectangular teal navigation elements with hover effect
  /// Now uses routeName for navigation. Added optional width parameter.
  Widget _buildBubble(String text, {String? routeName, double width = 250}) {
    final Color tealColor = const Color(0xFF41DDB9);
    final Color purpleColor = const Color(0xFFA067E5);

    _isHovering.putIfAbsent(text, () => false);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering[text] = true),
      onExit: (_) => setState(() => _isHovering[text] = false),
      child: InkWell(
        // Use Navigator.pushNamed if routeName is provided
        onTap: routeName == null
            ? null // If no route name, tapping does nothing
            : () => Navigator.pushNamed(context, routeName),
        child: Container(
          width: width, // Use the provided width
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: _isHovering[text] == true ? purpleColor : tealColor,
            borderRadius: BorderRadius.circular(5),
            // Removed the dotted border logic for simplicity, can be added back if needed
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
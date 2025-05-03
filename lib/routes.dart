import 'package:flutter/material.dart';

//Detail resep import
import 'recipe_detail/screens/recipe_detail_screen.dart';
import 'recipe_detail/recipe_detail.dart'; // Import the file with getSampleRecipe
import 'recipe_detail/models/recipe.dart'; // Import the Recipe model

//import bookmark
import 'bookmark/bookmark.dart';

// Define placeholder pages for now
class PlaceholderPage extends StatelessWidget {
  final String title;
  const PlaceholderPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('Page for: $title')),
    );
  }
}


// Route names
class AppRoutes {
  static const String login = '/login';
  static const String detailResep = '/detail-resep';
  static const String bookmark = '/bookmark';
  static const String homepage = '/homepage';
  static const String accountSetup = '/account-setup';
  // Sidebar starts
  static const String profile = '/profile';
  static const String appSettings = '/settings';
  static const String about = '/about';
  // Sidebar ends
  static const String welcome = '/welcome';
  static const String tambahResep = '/tambah-resep';
  static const String notifikasi = '/notifikasi';



  // Function to generate routes (can be expanded later)
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // In the future, you can use a switch statement based on settings.name
    // to return MaterialPageRoute for each actual page.
    // For now, all routes lead to a placeholder page.
    String pageTitle = settings.name ?? 'Unknown';

    // Simple mapping for placeholder titles
     switch (settings.name) {
       case login:
         pageTitle = 'Login';
         break;
       case detailResep:
        // Get the sample recipe data
        final Recipe sampleRecipe = getSampleRecipe();
        // Return the MaterialPageRoute for RecipeDetailScreen
        return MaterialPageRoute(
          builder: (context) => RecipeDetailScreen(recipe: sampleRecipe),
          settings: settings,
        );
       case bookmark:
         return MaterialPageRoute(
           builder: (context) => BookmarkScreen(), // Assuming you have a BookmarkScreen widget
           settings: settings,
         );
       case homepage:
         pageTitle = 'Homepage';
         break;
       case accountSetup:
         pageTitle = 'Account Setup';
         break;
       case profile:
         pageTitle = 'Profile';
         break;
       case appSettings:
         pageTitle = 'Settings';
         break;
       case about:
         pageTitle = 'About';
         break;
       case welcome:
         pageTitle = 'Welcome Page';
         break;
       case tambahResep:
         pageTitle = 'Tambah Resep';
         break;
       case notifikasi:
         pageTitle = 'Notifikasi';
         break;
       default:
         pageTitle = 'Unknown Page';
     }

    return MaterialPageRoute(
      builder: (context) => PlaceholderPage(title: pageTitle),
      settings: settings, // Pass settings for potential arguments later
    );
  }
}
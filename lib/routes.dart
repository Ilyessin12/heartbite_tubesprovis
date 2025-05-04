import 'package:flutter/material.dart';

// === Detail Resep dan Model ===
import 'recipe_detail/screens/recipe_detail_screen.dart';
import 'recipe_detail/recipe_detail.dart'; // Import the file with getSampleRecipe
import 'recipe_detail/models/recipe.dart'; // Import the Recipe model

//import bookmark
import 'bookmark/bookmark.dart';
import 'bookmark/bookmark-edit.dart';
import 'bookmark/bookmark-create.dart';
import 'bookmark/bookmark-detail.dart';

// Define placeholder pages for now

// === Halaman Tim (Default) ===
// (Halaman lainnya tetap gunakan Placeholder)

// === Halaman Milikmu ===
import 'recipe_detail/screens/heartbite_screen.dart';
import 'recipe_detail/screens/profile_screen.dart';
import 'recipe_detail/screens/following_screen.dart';
import 'recipe_detail/screens/followers_screen.dart';
import 'recipe_detail/screens/settings_screen.dart';
import 'recipe_detail/screens/country_screen.dart';
import 'recipe_detail/screens/notification_preferences_screen.dart';
import 'recipe_detail/screens/about_screen.dart';
import 'recipe_detail/screens/edit_profile_screen.dart';

// === Halaman Login
import 'login-register/login.dart';
import 'login-register/auth.dart';
import 'login-register/otp.dart';
import 'login-register/register.dart';
import 'login-register/forgotPass.dart';
import 'login-register/verifMethod.dart';
import 'login-register/resetPass.dart';


// homepage
import 'homepage/homepage.dart';

// === Placeholder Sementara ===
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

// === AppRoutes ===
class AppRoutes {
  // Halaman Utama
  static const String login = '/login';
  static const String detailResep = '/detail-resep';
  static const String bookmark = '/bookmark';
  static const String homepage = '/homepage';
  static const String accountSetup = '/account-setup';
  static const String profile = '/profile';
  static const String appSettings = '/settings';
  static const String about = '/about';
  static const String welcome = '/welcome';
  static const String tambahResep = '/tambah-resep';
  static const String notifikasi = '/notifikasi';

  // sidebar routes
  static const String heartbite = '/heartbite';
  static const String following = '/following';
  static const String followers = '/followers';
  static const String settingsCountry = '/settings/country';
  static const String settingsNotif = '/settings/notifications';
  static const String editProfile = '/edit-profile';

  // bookmark routes
  static const String bookmarkEdit = '/bookmark/edit';
  static const String bookmarkCreate = '/bookmark/create';
  static const String bookmarkDetail = '/bookmark/detail';


  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // === Halaman Tim ===
      case login:
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
          settings: settings,
        );
      case detailResep:
        final Recipe sampleRecipe = getSampleRecipe();
        return MaterialPageRoute(
          builder: (_) => RecipeDetailScreen(recipe: sampleRecipe),
          settings: settings,
        );
       case bookmark:
        return MaterialPageRoute(
          builder: (_) => const BookmarkScreen(),
          settings: settings,
        );
      case homepage:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
          settings: settings,
        );
      case accountSetup:
        return _placeholder('Account Setup');
      case profile:
        return MaterialPageRoute(
          builder: (_) => const ProfileScreen(),
          settings: settings,
        );
      case appSettings:
        return MaterialPageRoute(
          builder: (_) => const SettingsScreen(),
          settings: settings,
        );
      case about:
        return MaterialPageRoute(
          builder: (_) => const AboutScreen(),
          settings: settings,
        );
      case welcome:
        return _placeholder('Welcome Page');
      case tambahResep:
        return _placeholder('Tambah Resep');
      case notifikasi:
        return _placeholder('Notifikasi');

      // === sidebar routes ===
      case heartbite:
        return MaterialPageRoute(
          builder: (_) => const HeartbiteScreen(),
          settings: settings,
        );
      case following:
        return MaterialPageRoute(
          builder: (_) => const FollowingScreen(),
          settings: settings,
        );
      case followers:
        return MaterialPageRoute(
          builder: (_) => const FollowersScreen(),
          settings: settings,
        );
      case settingsCountry:
        return MaterialPageRoute(
          builder: (_) => const CountryScreen(),
          settings: settings,
        );
      case settingsNotif:
        return MaterialPageRoute(
          builder: (_) => const NotificationPreferencesScreen(),
          settings: settings,
        );
      case editProfile:
        return MaterialPageRoute(
          builder: (_) => const EditProfileScreen(),
          settings: settings,
        );

      // === bookmark routes ===
      case bookmarkCreate:
        return MaterialPageRoute(
          builder: (_) => const BookmarkCreateScreen(),
          settings: settings,
        );

      // === Default: Page Not Found ===
      default:
        return _placeholder('Unknown Page');
    }
  }

  static MaterialPageRoute _placeholder(String title) {
    return MaterialPageRoute(
      builder: (_) => PlaceholderPage(title: title),
      settings: RouteSettings(name: title),
    );
  }
}

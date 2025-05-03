import 'package:flutter/material.dart';

// === Detail Resep dan Model ===
import 'recipe_detail/screens/recipe_detail_screen.dart';
import 'recipe_detail/recipe_detail.dart';
import 'recipe_detail/models/recipe.dart';

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

  // Tambahan routes milikmu:
  static const String heartbite = '/heartbite';
  static const String following = '/following';
  static const String followers = '/followers';
  static const String settingsCountry = '/settings/country';
  static const String settingsNotif = '/settings/notifications';
  static const String editProfile = '/edit-profile';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // === Halaman Tim ===
      case login:
        return _placeholder('Login');
      case detailResep:
        final Recipe sampleRecipe = getSampleRecipe();
        return MaterialPageRoute(
          builder: (_) => RecipeDetailScreen(recipe: sampleRecipe),
          settings: settings,
        );
      case bookmark:
        return _placeholder('Bookmark');
      case homepage:
        return _placeholder('Homepage');
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

      // === Halaman Tambahan dari Versimu ===
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

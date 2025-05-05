import 'package:flutter/material.dart';
//========= import welcome pages
import 'welcome_pages/welcome.dart';
import 'welcome_pages/welcome1.dart';
import 'welcome_pages/welcome2.dart';
import 'welcome_pages/welcome3.dart';
//========= import login pages
import 'login-register/auth.dart';
import 'login-register/forgotPass.dart';
import 'login-register/login.dart';
import 'login-register/otp.dart';
import 'login-register/register.dart';
import 'login-register/resetPass.dart';
import 'login-register/verifMethod.dart';
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
//===== import sidebar pages
import 'sidebar/screens/about_screen.dart';
import 'sidebar/screens/country_screen.dart';
import 'sidebar/screens/edit_profile_screen.dart';
import 'sidebar/screens/followers_screen.dart';
import 'sidebar/screens/following_screen.dart';
import 'sidebar/screens/notification_preferences_screen.dart';
import 'sidebar/screens/profile_screen.dart';
import 'sidebar/screens/settings_screen.dart';
//==== import detail resep pages
import 'recipe_detail/recipe_detail.dart';
import 'recipe_detail/screens/recipe_detail_screen.dart';
import 'recipe_detail/screens/ingredients_screen.dart';
import 'recipe_detail/screens/directions_screen.dart';
import 'recipe_detail/screens/gallery_screen.dart';
import 'recipe_detail/screens/discussion_screen.dart';

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
        scaffoldBackgroundColor: Colors.white, // Set background to white
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF8E1616),
          primary: const Color(0xFF8E1616).withOpacity(0.2), // 20% opacity for buttons
          onPrimary: Colors.white, // White text for contrast
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF8E1616).withOpacity(0.3), // 20% opacity
            foregroundColor: Colors.white, // White text/icon on buttons
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.black87),
          bodySmall: TextStyle(color: Colors.black54),
        ),
      ),
      home: const NavigationPage(),
    );
  }
}

class PageItem {
  final String title;
  final Widget page;
  final String description;

  PageItem(this.title, this.page, this.description);
}

class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Daftar tombol dan halaman yang ingin dituju, dengan deskripsi
    final Map<String, List<PageItem>> categorizedPages = {
      'Welcome Pages': [
        PageItem('Welcome Screen', const WelcomeScreen(),
            'Initial welcome screen for the HeartBite app.'),
        PageItem('Welcome 1 Screen', const Welcome1Screen(),
            'First onboarding screen introducing app features.'),
        PageItem('Welcome 2 Screen', const Welcome2Screen(),
            'Second onboarding screen highlighting user benefits.'),
        PageItem('Welcome 3 Screen', const Welcome3Screen(),
            'Final onboarding screen before authentication.'),
      ],
      'Login Pages': [
        PageItem('Authentication', const Auth(),
            'Main authentication page for login or registration.'),
        PageItem('Login', const LoginPage(), 'User login page with email and password.'),
        PageItem('Register', const RegisterPage(),
            'User registration page for creating a new account.'),
        PageItem('Forgot Password', const ForgotPassPage(),
            'Page to initiate password recovery.'),
        PageItem('Reset Password', const ResetPassPage(),
            'Page to reset user password after verification.'),
        PageItem('OTP', const OtpPage(),
            'Page for entering one-time password for verification.'),
        PageItem('Verification Method', const VerifMethodPage(),
            'Page to choose verification method for account recovery.'),
      ],
      'Setup Pages': [
        PageItem('Setup Allergies', const SetupAllergiesPage(),
            'Page to configure user allergies for personalized recipes.'),
        PageItem('Setup Diets', const SetupDietsPage(),
            'Page to select dietary preferences.'),
        PageItem('Setup Account', const SetupAccountPage(),
            'Page to finalize account setup with user details.'),
        PageItem('Finish Setup', const FinishSetupScreen(),
            'Confirmation page after completing setup.'),
      ],
      'Notification Pages': [
        PageItem('Empty Notification', const EmptyNotificationPage(),
            'Page shown when there are no notifications.'),
        PageItem('Notification', const NotificationPage(),
            'Page displaying user notifications.'),
      ],
      'Bookmark Pages': [
        PageItem('Bookmark', const BookmarkScreen(),
            'Page listing all bookmarked recipes.'),
        //PageItem('Bookmark Create', const BookmarkCreateScreen(),
        //    'Page to create a new bookmark for a recipe.'),
        // PageItem('Bookmark Detail', const BookmarkDetailScreen(),
        //     'Page showing details of a bookmarked recipe.'),
        // PageItem('Bookmark Edit', const BookmarkEditScreen(),
        //     'Page to edit an existing bookmark.'),
      ],
      'Homepage Pages': [
        PageItem('Home Page', const HomePage(), 'Main homepage of the HeartBite app.'),
        // PageItem('Home Page Detail', const HomePageDetailScreen(),
        //     'Detailed view of a selected item from the homepage.'),
      ],
      'Sidebar Pages': [
        PageItem('About Page', const AboutScreen(),
            'Page with information about the HeartBite app.'),
        PageItem('Country Page', const CountryScreen(),
            'Page to select or view country settings.'),
        PageItem('Edit Profile Page', const EditProfileScreen(),
            'Page to update user profile information.'),
        PageItem('Followers Page', const FollowersScreen(),
            'Page listing user followers.'),
        PageItem('Following Page', const FollowingScreen(),
            'Page listing users followed by the user.'),
        PageItem('Notification Preferences Page',
            const NotificationPreferencesScreen(),
            'Page to configure notification settings.'),
        PageItem('Profile Page', const ProfileScreen(),
            'Page displaying user profile details.'),
        PageItem('Setting Page', const SettingsScreen(),
            'Page for general app settings.'),
      ],
      'Recipe Detail Pages': [
        PageItem(
            'Recipe Detail',
            RecipeDetailScreen(recipe: getSampleRecipe()),
            'Main page showing details of a selected recipe.'),
        PageItem(
            'Recipe Ingredients',
            IngredientsScreen(recipe: getSampleRecipe()),
            'Page listing ingredients for a recipe.'),
        PageItem(
            'Recipe Directions',
            DirectionsScreen(recipe: getSampleRecipe()),
            'Page with step-by-step cooking instructions.'),
        PageItem(
            'Recipe Gallery',
            GalleryScreen(
                images: getSampleRecipe().galleryImages, initialIndex: 0),
            'Page displaying recipe images in a gallery.'),
        PageItem(
            'Recipe Discussion',
            DiscussionScreen(
              comments: getSampleRecipe().comments,
              onCommentsUpdated: (updatedComments) {
                print('Comments updated: ${updatedComments.length} comments');
              },
            ),
            'Page for viewing and adding recipe comments.'),
      ],
    };

    return Scaffold(
      backgroundColor: Colors.white, // Ensure scaffold background is white
      appBar: AppBar(
        title: const Text('HeartBite Navigation'),
        backgroundColor: const Color(0xFF8E1616), // Solid color for AppBar
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Group Details Box
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Provis Kelompok 23',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF8E1616),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Provis Kelompok 23:',
                      style: TextStyle(
                        fontSize: 1,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text('1. 2308428    LYAN NAZHABIL DZUQUWWA'),
                    Text('2. 2307840    ISMAIL FATIH RAIHAN'),
                    Text('3. 2305672    MUHAMMAD HAFIDH FADHILAH'),
                    Text('4. 2306026    ELSA NURJANAH'),
                    Text('5. 2306924    MUHAMMAD ICHSAN KHAIRULLAH'),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // Categorized Pages
              ...categorizedPages.entries.map((category) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category.key,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF8E1616),
                      ),
                    ),
                    const SizedBox(height: 12),
                    ...category.value.map((page) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => page.page),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 60),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            alignment: Alignment.centerLeft,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                page.title,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                page.description,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                    const SizedBox(height: 16),
                  ],
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
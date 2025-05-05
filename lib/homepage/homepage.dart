import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart' hide Key, Text, Navigator, List; // Hide List here
import 'dart:ui';

// Import bottom navigation bar
import '../bottomnavbar/bottom-navbar.dart';
// Import the detail screen
import 'homepage-detail.dart';

// Placeholder for RecipeItem model (assuming similar structure to bookmark-detail)
// You might need to adjust this based on your actual data model
class RecipeItem {
  final String id; // Added id for state management
  final String name;
  final double rating;
  final int reviewCount;
  final int calories;
  final String prepTime; // Assuming this represents Porsi
  final int cookTime;
  final String imagePath;
  bool isBookmarked; // To track bookmark state

  RecipeItem({
    required this.id,
    required this.name,
    required this.rating,
    required this.reviewCount,
    required this.calories,
    required this.prepTime,
    required this.cookTime,
    required this.imagePath,
    this.isBookmarked = false,
  });
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0; // For BottomNavBar

  // Dummy data - replace with your actual data fetching logic
  final List<RecipeItem> _latestRecipes = [
    RecipeItem(id: 'l1', name: "Sandwich with boiled egg", rating: 4.5, reviewCount: 128, calories: 23, prepTime: "1-2 Porsi", cookTime: 12, imagePath: 'assets/images/cookbooks/placeholder_image.jpg'),
    RecipeItem(id: 'l2', name: "Fruity blueberry toast", rating: 4.8, reviewCount: 150, calories: 23, prepTime: "1-2 Porsi", cookTime: 12, imagePath: 'assets/images/cookbooks/placeholder_image.jpg'),
    RecipeItem(id: 'l3', name: "Blueberry pancakes", rating: 4.7, reviewCount: 200, calories: 23, prepTime: "1-2 Porsi", cookTime: 12, imagePath: 'assets/images/cookbooks/placeholder_image.jpg'),
  ];

  final List<RecipeItem> _popularRecipes = [
    RecipeItem(id: 'p1', name: "Sandwich with boiled egg", rating: 4.5, reviewCount: 128, calories: 23, prepTime: "1-2 Porsi", cookTime: 12, imagePath: 'assets/images/cookbooks/placeholder_image.jpg'),
    RecipeItem(id: 'p2', name: "Fruity blueberry toast", rating: 4.8, reviewCount: 150, calories: 23, prepTime: "1-2 Porsi", cookTime: 12, imagePath: 'assets/images/cookbooks/placeholder_image.jpg'),
    RecipeItem(id: 'p3', name: "Blueberry pancakes", rating: 4.7, reviewCount: 200, calories: 23, prepTime: "1-2 Porsi", cookTime: 12, imagePath: 'assets/images/cookbooks/placeholder_image.jpg'),
    RecipeItem(id: 'p4', name: "Blueberry pancakes", rating: 4.7, reviewCount: 200, calories: 23, prepTime: "1-2 Porsi", cookTime: 12, imagePath: 'assets/images/cookbooks/placeholder_image.jpg'),
  ];

  final List<RecipeItem> _breakfastRecipes = [
    RecipeItem(id: 'b1', name: "Sandwich with boiled egg", rating: 4.5, reviewCount: 128, calories: 23, prepTime: "1-2 Porsi", cookTime: 12, imagePath: 'assets/images/cookbooks/placeholder_image.jpg'),
    RecipeItem(id: 'b2', name: "Fruity blueberry toast", rating: 4.8, reviewCount: 150, calories: 23, prepTime: "1-2 Porsi", cookTime: 12, imagePath: 'assets/images/cookbooks/placeholder_image.jpg'),
    RecipeItem(id: 'b3', name: "Blueberry pancakes", rating: 4.7, reviewCount: 200, calories: 23, prepTime: "1-2 Porsi", cookTime: 12, imagePath: 'assets/images/cookbooks/placeholder_image.jpg'),
    RecipeItem(id: 'b4', name: "Blueberry pancakes", rating: 4.7, reviewCount: 200, calories: 23, prepTime: "1-2 Porsi", cookTime: 12, imagePath: 'assets/images/cookbooks/placeholder_image.jpg'),
  ];

  void _onBottomNavTapped(int index){
    setState((){
      _currentIndex = index;
    });
    // Handle navigation based on index
    if(index == 1){
      // Navigate to Bookmark screen (replace with your actual navigation)
      print('Navigate to Bookmark');
    }
    // Add other navigation logic if needed
  }

  void _onFabPressed(){
    // Handle FAB press action (e.g., navigate to create recipe screen)
    print('FAB pressed on HomePage');
  }

  void _toggleBookmark(String recipeId){
    setState((){
      // Find and update the recipe in all lists where it might appear
      final List<List<RecipeItem>> allLists = [_latestRecipes, _popularRecipes, _breakfastRecipes];
      for(var list in allLists){
        final index = list.indexWhere((recipe) => recipe.id == recipeId);
        if(index != -1){
          list[index].isBookmarked = !list[index].isBookmarked;
        }
      }
    });
  }

  // Helper function to navigate to detail screen
  void _navigateToDetail(String title, List<RecipeItem> recipes){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomePageDetailScreen(
          title: title,
          recipes: recipes,
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 60, // Adjust as needed
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: CircleAvatar(
            backgroundImage: AssetImage("assets/images/homepage/placeholder_profile.jpg"), // Placeholder profile image
          ),
        ),
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search recipe',
              hintStyle: GoogleFonts.dmSans(color: Colors.grey[600]),
              prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 10.0), // Adjust vertical padding
            ),
            style: GoogleFonts.dmSans(color: Colors.black),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(SolarIconsOutline.bell, color: Colors.black),
            onPressed: (){
              // Handle notification tap
            },
          ),
          const SizedBox(width: 8), // Add some spacing before the edge
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            // Resep Masakan Terbaru Section
            _buildSectionTitle("Resep Masakan Terbaru"), // No "view all" here
            _buildHorizontalRecipeList(_latestRecipes),

            // Popular Recipes Section
            _buildSectionTitle(
              "Popular Recipes",
              showViewAll: true,
              onViewAllTap: () => _navigateToDetail("Popular Recipes", _popularRecipes),
            ),
            _buildRecipeGrid(_popularRecipes),

            // Menu Sarapan Mudah Section
            _buildSectionTitle(
              "Menu Sarapan Mudah",
              showViewAll: true,
              onViewAllTap: () => _navigateToDetail("Menu Sarapan Mudah", _breakfastRecipes),
            ),
            _buildRecipeGrid(_breakfastRecipes),

            const SizedBox(height: 20), // Add padding at the bottom
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onBottomNavTapped,
        onFabPressed: _onFabPressed,
      ),
    );
  }

  Widget _buildSectionTitle(String title, {bool showViewAll = false, VoidCallback? onViewAllTap}){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.dmSans(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          if(showViewAll)
            GestureDetector( // Wrap "view all" with GestureDetector
              onTap: onViewAllTap, // Call the provided callback
              child: Text(
                'view all',
                style: GoogleFonts.dmSans(
                  fontSize: 14,
                  color: const Color(0xFF8E1616),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildHorizontalRecipeList(List<RecipeItem> recipes){
    // This builds the horizontally scrolling list for "Resep Masakan Terbaru"
    return Container(
      height: 180, // Adjust height as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        itemCount: recipes.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.only(right: 16.0),
            // Wrap the card with GestureDetector for navigation
            child: GestureDetector(
              onTap: () => _navigateToDetail("Resep Masakan Terbaru", recipes), // Navigate on tap
              child: _buildLatestRecipeCard(recipes[index]),
            ),
          );
        },
      ),
    );
  }

  Widget _buildLatestRecipeCard(RecipeItem recipe){
    // Special card for the horizontal list - No changes needed here for navigation itself
    return Container(
      width: 250, // Adjust width as needed
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              recipe.imagePath,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          // Gradient overlay
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
                  stops: const [0.5, 1.0],
                ),
              ),
            ),
          ),
          // Text content
          Positioned(
            bottom: 10,
            left: 10,
            right: 10,
            child: Text(
              recipe.name,
              style: GoogleFonts.dmSans(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          // Note: We don't add the bookmark icon here as per the design
        ],
      ),
    );
  }


  Widget _buildRecipeGrid(List<RecipeItem> recipes){
    return GridView.builder(
      shrinkWrap: true, // Important to prevent infinite height error in ListView
      physics: const NeverScrollableScrollPhysics(), // Disable GridView's own scrolling
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        childAspectRatio: 0.7, // Adjust aspect ratio as needed
      ),
      itemCount: recipes.length,
      itemBuilder: (context, index){
        // You might want to add navigation here too if clicking individual grid items
        // should go somewhere specific, otherwise, keep as is.
        return RecipeCard(
          recipe: recipes[index],
          onBookmarkTap: () => _toggleBookmark(recipes[index].id),
        );
      },
    );
  }
}


// Re-using RecipeCard from bookmark-detail.dart with modifications for bookmark toggle
class RecipeCard extends StatelessWidget {
  final RecipeItem recipe;
  final VoidCallback onBookmarkTap; // Callback for bookmark tap

  const RecipeCard({
    Key? key,
    required this.recipe,
    required this.onBookmarkTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        children: [
          // Recipe image
          Positioned.fill(
            child: Image.asset(
              recipe.imagePath,
              fit: BoxFit.cover,
            ),
          ),
          // Gradient overlay for text visibility
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
                  stops: const [0.6, 1.0],
                ),
              ),
            ),
          ),
          // Bookmark icon with blur background
          Positioned(
            top: 10,
            right: 10,
            child: GestureDetector( // Use GestureDetector for tap detection
              onTap: onBookmarkTap,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: recipe.isBookmarked
                        ? const BookmarkSolid( // Show solid if bookmarked
                            width: 18,
                            height: 18,
                            color: Colors.white,
                          )
                        : const Bookmark( // Show outline if not bookmarked
                            width: 18,
                            height: 18,
                            color: Colors.white,
                          ),
                  ),
                ),
              ),
            ),
          ),
          // Recipe details overlaid on image
          Positioned(
            bottom: 10,
            left: 10,
            right: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Rating
                Row(
                  children: [
                    const Icon(Icons.star, size: 16, color: Colors.amber),
                    const SizedBox(width: 4),
                    Text(
                      '${recipe.rating} (${recipe.reviewCount} ulasan)',
                      style: GoogleFonts.dmSans(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                // Recipe name
                Text(
                  recipe.name,
                  style: GoogleFonts.dmSans(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                // Recipe info with dividers
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible( // Use Flexible to prevent overflow
                      child: Text(
                        '${recipe.calories} Cal', // Shortened for space
                        style: GoogleFonts.dmSans(
                          fontSize: 11, // Slightly smaller font
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Text(
                      ' | ',
                      style: TextStyle(fontSize: 11, color: Colors.white),
                    ),
                    Flexible(
                      child: Text(
                        recipe.prepTime, // Porsi
                        style: GoogleFonts.dmSans(
                          fontSize: 11,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Text(
                      ' | ',
                      style: TextStyle(fontSize: 11, color: Colors.white),
                    ),
                    Flexible(
                      child: Text(
                        '${recipe.cookTime} min', // Shortened for space
                        style: GoogleFonts.dmSans(
                          fontSize: 11,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
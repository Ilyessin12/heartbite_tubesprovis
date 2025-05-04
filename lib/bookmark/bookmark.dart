import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solar_icons/solar_icons.dart';

// Import navigation components
import '../bottomnavbar/bottom-navbar.dart';
import 'bookmark-detail.dart';

// Model for bookmark categories
class BookmarkCategory{
  final String name;
  final String imageUrl;
  final List<RecipeItem> recipes;
  bool isSelected;

  BookmarkCategory({
    required this.name,
    required this.imageUrl,
    required this.recipes,
    this.isSelected = false,
  });
}

// Model for recipe items
class RecipeItem{
  final String name;
  final String imageUrl;
  final double rating;
  final int reviewCount;
  final int calories;
  final int prepTime;
  final int cookTime;

  RecipeItem({
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.reviewCount,
    required this.calories,
    required this.prepTime,
    required this.cookTime,
  });
}

class BookmarkScreen extends StatefulWidget{
  const BookmarkScreen({Key? key}) : super(key: key);

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen>{
  // Sample data for bookmark categories
  final List<BookmarkCategory> categories = [
    BookmarkCategory(
      name: 'Saved',
      imageUrl: 'placeholder_image.jpg',
      recipes: [],
    ),
    BookmarkCategory(
      name: 'Weekend Recipe',
      imageUrl: 'placeholder_image.jpg',
      recipes: [
        RecipeItem(
          name: 'Fruity blueberry toast',
          imageUrl: 'placeholder_image.jpg',
          rating: 4.8,
          reviewCount: 128,
          calories: 23,
          prepTime: 2,
          cookTime: 12,
        ),
        RecipeItem(
          name: 'Fruity blackberry toast',
          imageUrl: 'placeholder_image.jpg',
          rating: 4.8,
          reviewCount: 128,
          calories: 24,
          prepTime: 2,
          cookTime: 12,
        ),
      ],
    ),
    BookmarkCategory(
      name: 'Dinner',
      imageUrl: 'placeholder_image.jpg',
      recipes: [],
    ),
  ];

  // Track selected categories for deletion
  Set<int> selectedCategories = {};
  
  void toggleCategorySelection(int index){
    // Don't allow selection of "Saved" category
    if(categories[index].name == 'Saved'){
      return;
    }

    setState(() {
      if(selectedCategories.contains(index)){
        selectedCategories.remove(index);
      }
      else {
        selectedCategories.add(index);
      }
    });
  }

  void deleteSelectedCategories(){
    setState(() {
      // Sort in reverse order to avoid index shifting issues
      final toDelete = selectedCategories.toList()..sort((a, b) => b.compareTo(a));
      
      for(final index in toDelete){
        if(categories[index].name != 'Saved'){
          categories.removeAt(index);
        }
      }
      
      // Clear selections after deletion
      selectedCategories.clear();
    });
  }

  void handleBottomNavTap(int index){
    // In a real app, you'd navigate to different screens
    print('Navigated to index: $index');
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: selectedCategories.isNotEmpty
          ? Text(
              '${selectedCategories.length} item selected',
              style: GoogleFonts.dmSans(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            )
          : Text(
              'Bookmark',
              style: GoogleFonts.dmSans(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: selectedCategories.isNotEmpty
            ? () => setState(() => selectedCategories.clear())
            : () => Navigator.of(context).pop(),
        ),
        actions: [
          selectedCategories.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.delete, color: Color(0xFF8E1616)),
                  onPressed: deleteSelectedCategories,
                )
              : Container(
                  margin: const EdgeInsets.only(right: 16.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF0E0E0),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.add, color: Color(0xFF8E1616)),
                    onPressed: (){},
                  ),
                ),
        ],
      ),
      body: SafeArea(
        child: GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index){
            return GestureDetector(
              onTap: (){
                if(selectedCategories.isNotEmpty){
                  toggleCategorySelection(index);
                }
                else {
                  // Navigate to category detail
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookmarkDetailScreen(
                        category: categories[index],
                      ),
                    ),
                  );
                }
              },
              onLongPress: (){
                toggleCategorySelection(index);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    // Category image
                    Image.asset(
                      'assets/images/cookbooks/placeholder_image.jpg',
                      fit: BoxFit.cover,
                    ),
                    // Gradient overlay
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.7),
                          ],
                        ),
                      ),
                    ),
                    // Category name
                    Positioned(
                      left: 10,
                      bottom: 10,
                      child: Text(
                        categories[index].name,
                        style: GoogleFonts.dmSans(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    // Selection indicator
                    if(selectedCategories.contains(index))
                      Positioned(
                        top: 10,
                        left: 10,
                        child: Container(
                          padding: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.check_circle,
                            size: 24,
                            color: Color(0xFFAFF4C6),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Delete button (only show when items are selected)
          if(selectedCategories.isNotEmpty)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: ElevatedButton(
                onPressed: deleteSelectedCategories,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF8E1616),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Delete Bookmark',
                  style: GoogleFonts.dmSans(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          // Navigation bar with integrated FAB
          BottomNavBar(
            currentIndex: 1, // 1 for bookmark screen
            onTap: handleBottomNavTap,
            onFabPressed: (){
              // Handle FAB pressed action
              print('FAB pressed on BookmarkScreen');
            },
          ),
        ],
      ),
    );
  }
}
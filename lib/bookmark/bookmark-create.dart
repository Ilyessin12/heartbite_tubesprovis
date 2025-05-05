import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

// Import bottom navigation components
import '../bottomnavbar/bottom-navbar.dart';
import 'bookmark.dart' show BookmarkCategory, RecipeItem;

class BookmarkCreateScreen extends StatefulWidget{
  const BookmarkCreateScreen({Key? key}) : super(key: key);

  @override
  State<BookmarkCreateScreen> createState() => _BookmarkCreateScreenState();
}

class _BookmarkCreateScreenState extends State<BookmarkCreateScreen>{
  final TextEditingController _titleController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  File? _selectedImage;
  List<RecipeItem> _selectedRecipes = [];
  bool _isSelectingCover = false;
  bool _isSelectingRecipes = true;
  
  // Sample cover options
  final List<String> _coverOptions = [
    'assets/images/cookbooks/placeholder_image.jpg',
    'assets/images/cookbooks/placeholder_image.jpg',
    'assets/images/cookbooks/placeholder_image.jpg',
  ];
  
  // Sample recipes to choose from
  final List<RecipeItem> _availableRecipes = [
    RecipeItem(
      name: 'Fruity blueberry toast',
      imageUrl: 'placeholder_image.jpg',
      rating: 4.5,
      reviewCount: 128,
      calories: 23,
      prepTime: 2,
      cookTime: 12,
    ),
    RecipeItem(
      name: 'Fruity blackberry toast',
      imageUrl: 'placeholder_image.jpg',
      rating: 4.5,
      reviewCount: 128,
      calories: 24,
      prepTime: 2,
      cookTime: 12,
    ),
    RecipeItem(
      name: 'Blueberry pancakes',
      imageUrl: 'placeholder_image.jpg',
      rating: 4.8,
      reviewCount: 106,
      calories: 29,
      prepTime: 2,
      cookTime: 25,
    ),
  ];
  
  @override
  void dispose(){
    _titleController.dispose();
    super.dispose();
  }

  void handleBottomNavTap(int index){
    // In a real app, you'd navigate to different screens
    print('Navigated to index: $index');
  }

  void createBookmark(){
    // Validate input
    if(_titleController.text.trim().isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a title')),
      );
      return;
    }
    
    // Create new bookmark category
    final newCategory = BookmarkCategory(
      name: _titleController.text.trim(),
      imageUrl: 'placeholder_image.jpg', // In a real app, you'd save the image
      recipes: _selectedRecipes,
    );
    
    // In a real app, you would save this to your database or state manager
    print('Created bookmark: ${newCategory.name} with ${_selectedRecipes.length} recipes');
    
    // Navigate back to previous screen
    Navigator.pop(context);
  }

  Future<void> _pickImage() async{
    try{
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1000,
        maxHeight: 1000,
        imageQuality: 85,
      );
      
      if(pickedFile != null){
        setState((){
          _selectedImage = File(pickedFile.path);
          _isSelectingCover = false;
        });
      }
    }
    catch(e){
      print('Error picking image: $e');
    }
  }

  void _showImageSourceOptions() async{
    showModalBottomSheet(
      context: context,
      builder: (context){
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: Text('Gallery', style: GoogleFonts.dmSans()),
                onTap: (){
                  Navigator.of(context).pop();
                  _pickImage();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: Text('Camera', style: GoogleFonts.dmSans()),
                onTap: () async{
                  Navigator.of(context).pop();
                  try{
                    final XFile? photo = await _picker.pickImage(
                      source: ImageSource.camera,
                      maxWidth: 1000,
                      maxHeight: 1000,
                      imageQuality: 85,
                    );
                    
                    if(photo != null){
                      setState((){
                        _selectedImage = File(photo.path);
                        _isSelectingCover = false;
                      });
                    }
                  }
                  catch(e){
                    print('Error taking photo: $e');
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.image),
                title: Text('Select from templates', style: GoogleFonts.dmSans()),
                onTap: (){
                  Navigator.of(context).pop();
                  setState((){
                    _isSelectingCover = true;
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }
  
  void _toggleRecipeSelection(RecipeItem recipe){
    setState((){
      final isSelected = _selectedRecipes.any((item) => item.name == recipe.name);
      
      if(isSelected){
        _selectedRecipes.removeWhere((item) => item.name == recipe.name);
      }
      else {
        _selectedRecipes.add(recipe);
      }
    });
  }

  @override
  Widget build(BuildContext context){
    if(_isSelectingCover){
      return _buildCoverSelectionScreen();
    }
    else if(_isSelectingRecipes){
      return _buildRecipeSelectionScreen();
    }
    else {
      return _buildMainCreateScreen();
    }
  }
  
  Widget _buildMainCreateScreen(){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Bookmark',
          style: GoogleFonts.dmSans(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Subtitle
                Text(
                  'Create Cookbook',
                  style: GoogleFonts.dmSans(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 24),
                
                // Image with border
                GestureDetector(
                  onTap: _showImageSourceOptions,
                  child: Container(
                    height: 160,
                    width: 160,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.purple,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: _selectedImage != null
                        ? Image.file(
                            _selectedImage!,
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            'assets/images/cookbooks/placeholder_image.jpg',
                            fit: BoxFit.cover,
                          ),
                    ),
                  ),
                ),
                
                // Change cover text
                GestureDetector(
                  onTap: _showImageSourceOptions,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 24.0),
                    child: Text(
                      'Change Cover',
                      style: GoogleFonts.dmSans(
                        fontSize: 16,
                        color: const Color(0xFF8E1616),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                
                // Title text field
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF0E0E0),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextField(
                    controller: _titleController,
                    style: GoogleFonts.dmSans(
                      fontSize: 16,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Title',
                      hintStyle: GoogleFonts.dmSans(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                
                const SizedBox(height: 40),
                
                // Create button
                Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: createBookmark,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF8E1616),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Create',
                      style: GoogleFonts.dmSans(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 1, // 1 for bookmark screen
        onTap: handleBottomNavTap,
        onFabPressed: (){
          // Handle FAB pressed action
          print('FAB pressed on BookmarkCreateScreen');
        },
      ),
    );
  }
  
  Widget _buildCoverSelectionScreen(){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Bookmark',
          style: GoogleFonts.dmSans(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: (){
            setState((){
              _isSelectingCover = false;
            });
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Subtitle
                Center(
                  child: Text(
                    'Change Cover',
                    style: GoogleFonts.dmSans(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                
                // Grid of cover options
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: _coverOptions.length,
                  itemBuilder: (context, index){
                    return GestureDetector(
                      onTap: (){
                        setState((){
                          _selectedImage = null; // Clear any camera/gallery selection
                          // In a real app, you'd store the selected template
                          _isSelectingCover = false;
                        });
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          _coverOptions[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 1, // 1 for bookmark screen
        onTap: handleBottomNavTap,
        onFabPressed: (){
          // Handle FAB pressed action
          print('FAB pressed on CoverSelectionScreen');
        },
      ),
    );
  }
  
  Widget _buildRecipeSelectionScreen(){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Bookmark',
          style: GoogleFonts.dmSans(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(), // Exit the entire create flow
        ),
        // Then update the AppBar actions in _buildRecipeSelectionScreen
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16.0),
            decoration: BoxDecoration(
              color: const Color(0xFFF0E0E0),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_forward, color: Color(0xFF8E1616)),
              onPressed: (){
                setState((){
                  _isSelectingRecipes = false;
                });
              },
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Add From',
                    style: GoogleFonts.dmSans(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if(_selectedRecipes.isNotEmpty)
                    Text(
                      '${_selectedRecipes.length} item selected',
                      style: GoogleFonts.dmSans(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  const SizedBox(height: 8),
                  Text(
                    'Saved',
                    style: GoogleFonts.dmSans(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.7,
                ),
                itemCount: _availableRecipes.length,
                itemBuilder: (context, index){
                  final recipe = _availableRecipes[index];
                  final isSelected = _selectedRecipes.any((item) => item.name == recipe.name);
                  
                  return GestureDetector(
                    onTap: () => _toggleRecipeSelection(recipe),
                    child: Stack(
                      children: [
                        RecipeCard(recipe: recipe),
                        if(isSelected)
                          Positioned(
                            top: 10,
                            left: 10,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.check_circle,
                                color: Colors.green,
                                size: 20,
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 1, // 1 for bookmark screen
        onTap: handleBottomNavTap,
        onFabPressed: (){
          // Handle FAB pressed action
          print('FAB pressed on RecipeSelectionScreen');
        },
      ),
    );
  }
}

class RecipeCard extends StatelessWidget{
  final RecipeItem recipe;

  const RecipeCard({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        children: [
          // Recipe image
          AspectRatio(
            aspectRatio: 0.8,
            child: Image.asset(
              'assets/images/cookbooks/placeholder_image.jpg',
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
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.7),
                  ],
                  stops: const [0.6, 1.0],
                ),
              ),
            ),
          ),
          // Bookmark icon with blur background
          Positioned(
            top: 10,
            right: 10,
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
                  child: const Icon(
                    Icons.bookmark,
                    color: Colors.white,
                    size: 18,
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
                ),
                const SizedBox(height: 8),
                // Recipe info with dividers
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '${recipe.calories} Cal',
                      style: GoogleFonts.dmSans(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      ' | ',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '${recipe.prepTime} Porsi',
                      style: GoogleFonts.dmSans(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      ' | ',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '${recipe.cookTime} min',
                      style: GoogleFonts.dmSans(
                        fontSize: 12,
                        color: Colors.white,
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
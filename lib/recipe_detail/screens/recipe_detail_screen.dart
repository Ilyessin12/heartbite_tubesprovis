import 'package:flutter/material.dart';
import '../models/recipe.dart';
import '../models/ingredient.dart';
import '../models/direction.dart';
import '../models/comment.dart';
import '../widgets/recipe_header.dart';
import '../widgets/ingredient_item.dart';
import '../widgets/direction_item.dart';
import '../widgets/comment_item.dart';
import '../widgets/gallery_grid.dart';
import '../utils/constants.dart';
import 'ingredients_screen.dart';
import 'gallery_screen.dart';
import 'bookmark_modal.dart';
import 'discussion_screen.dart';

class RecipeDetailScreen extends StatefulWidget {
  final Recipe recipe;
  
  const RecipeDetailScreen({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  State<RecipeDetailScreen> createState() => _RecipeDetailScreenState();
}

class _RecipeDetailScreenState extends State<RecipeDetailScreen> {
  bool isFavorite = false;
  bool isBookmarked = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isFavorite = !isFavorite;
                            });
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.pink.shade50,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              isFavorite ? Icons.favorite : Icons.favorite_border,
                              color: isFavorite ? AppColors.primary : Colors.grey,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: () {
                            _showBookmarkModal(context);
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.pink.shade50,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                              color: isBookmarked ? AppColors.primary : Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RecipeHeader(recipe: widget.recipe),
                    const SizedBox(height: 16),
                    
                    // Recipe stats
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: AppColors.cardBackground,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildStatItem(Icons.local_fire_department, "${widget.recipe.calories}", "Calories"),
                          _buildStatItem(Icons.people_outline, widget.recipe.portions, "Porsi"),
                          _buildStatItem(Icons.timer, "${widget.recipe.cookingMinutes}", "Mins"),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    
                    // Ingredients section
                    _buildSectionHeader("Ingredients", "${widget.recipe.ingredients.length} items"),
                    const SizedBox(height: 12),
                    ...widget.recipe.ingredients.map((ingredient) => 
                      IngredientItem(
                        ingredient: ingredient,
                        showCheckbox: false,
                      ),
                    ),
                    const SizedBox(height: 16),
                    
                    // Directions section
                    _buildSectionHeader("Directions", null),
                    const SizedBox(height: 12),
                    ...widget.recipe.directions.map((direction) => 
                      DirectionItem(
                        direction: direction,
                        showCheckbox: false,
                      ),
                    ),
                    const SizedBox(height: 16),
                    
                    // Start cooking button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => IngredientsScreen(recipe: widget.recipe),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "Start Cooking",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(Icons.arrow_forward, size: 16, color: Colors.white),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    
                    // Gallery section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Gallery",
                          style: AppTextStyles.subheading,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GalleryScreen(images: widget.recipe.galleryImages),
                              ),
                            );
                          },
                          child: const Text("view all"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    GalleryGrid(
                      images: widget.recipe.galleryImages,
                      onImageTap: (index) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GalleryScreen(
                              images: widget.recipe.galleryImages,
                              initialIndex: index,
                            ),
                          ),
                        );
                      },
                      crossAxisCount: 3,
                    ),
                    const SizedBox(height: 24),
                    
                    // Discussion section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Discussion",
                          style: AppTextStyles.subheading,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DiscussionScreen(comments: widget.recipe.comments),
                              ),
                            );
                          },
                          child: const Text("view all"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ...widget.recipe.comments.take(3).map((comment) => 
                      CommentItem(
                        comment: comment,
                        onLike: (liked) {
                          // Handle like
                          setState(() {
                            comment.isLiked = liked;
                            if (liked) {
                              comment.likeCount += 1;
                            } else {
                              comment.likeCount -= 1;
                            }
                          });
                        },
                        onReply: () {
                          // Handle reply
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    
                    // Comment input
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: AppColors.cardBackground,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Row(
                        children: [
                          const Expanded(
                            child: Text(
                              "Discuss here",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: const Icon(
                              Icons.send,
                              color: AppColors.primary,
                              size: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatItem(IconData icon, String value, String label) {
    return Column(
      children: [
        Icon(icon, color: AppColors.primary),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: AppTextStyles.caption,
        ),
      ],
    );
  }

  Widget _buildSectionHeader(String title, String? subtitle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyles.subheading,
        ),
        if (subtitle != null)
          Text(
            subtitle,
            style: AppTextStyles.caption,
          ),
      ],
    );
  }

  void _showBookmarkModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => BookmarkModal(
        onSave: (cookbookId) {
          setState(() {
            isBookmarked = true;
          });
          Navigator.pop(context);
        },
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'models/recipe.dart';
import 'models/ingredient.dart';
import 'models/direction.dart';
import 'models/comment.dart';
import 'screens/recipe_detail_screen.dart';
import 'utils/theme.dart';
import 'utils/constants.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      home: RecipeDetailScreen(recipe: _getSampleRecipe()),
    );
  }
  
  // Sample data for testing
  Recipe _getSampleRecipe() {
    return Recipe(
      id: '1',
      title: 'Sandwich with boiled egg',
      imageUrl: 'assets/images/recipes/sandwich1.jpg',
      rating: 4.5,
      reviewCount: 128,
      authorName: 'Amelia Melanes',
      authorRecipeCount: 23,
      calories: 23,
      portions: '1-2',
      cookingMinutes: 12,
      ingredients: [
        Ingredient(
          order: 1,
          name: 'Eggs',
          amount: '250',
          unit: 'g',
        ),
        Ingredient(
          order: 2,
          name: 'Bread',
          amount: '2',
          unit: 'slices',
        ),
        Ingredient(
          order: 3,
          name: 'Mayonnaise',
          amount: '2',
          unit: 'tbsp',
        ),
        Ingredient(
          order: 4,
          name: 'Lettuce',
          amount: '1',
          unit: 'leaf',
        ),
      ],
      directions: [
        Direction(
          order: 1,
          description: 'Chop eggs',
        ),
        Direction(
          order: 2,
          description: 'Mix mayonnaise, lemon juice, mustard, salt, and pepper in medium bowl',
          imageUrl: 'assets/images/ingredients/mixing_bowl.jpg',
        ),
        Direction(
          order: 3,
          description: 'Add chopped eggs, celery and green onions; mix well',
        ),
        Direction(
          order: 4,
          description: 'Refrigerate, covered to blend flavors',
        ),
      ],
      galleryImages: [
        'assets/images/recipes/sandwich1.jpg',
        'assets/images/recipes/sandwich2.jpg',
        'assets/images/recipes/sandwich3.jpg',
        'assets/images/recipes/sandwich4.jpg',
        'assets/images/recipes/sandwich5.jpg',
        'assets/images/recipes/sandwich6.jpg',
        'assets/images/recipes/sandwich7.jpg',
        'assets/images/recipes/sandwich8.jpg',
      ],
      comments: [
        Comment(
          id: '1',
          userName: 'Antonio',
          userImageUrl: 'assets/images/avatars/avatar5.jpg',
          text: 'Duis aute irure dolor in reprehenderit',
          timeAgo: '1d ago',
          likeCount: 32,
        ),
        Comment(
          id: '2',
          userName: 'Melanie Rose',
          userImageUrl: 'assets/images/avatars/avatar1.jpg',
          text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit sed do',
          timeAgo: '2h ago',
          likeCount: 424,
        ),
        Comment(
          id: '3',
          userName: 'Jonathan Jose',
          userImageUrl: 'assets/images/avatars/avatar2.jpg',
          text: 'Excepteur sint occaecat cupidatat non proident, sunt',
          timeAgo: '5h ago',
          likeCount: 25,
        ),
        Comment(
          id: '4',
          userName: 'Nicky',
          userImageUrl: 'assets/images/avatars/avatar3.jpg',
          text: 'nisi ut aliquip ex ea commodo consequat',
          timeAgo: '1d ago',
          likeCount: 142,
        ),
        Comment(
          id: '5',
          userName: 'Moon Star',
          userImageUrl: 'assets/images/avatars/avatar4.jpg',
          text: 'quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea',
          timeAgo: '2d ago',
          likeCount: 82,
        ),
        Comment(
          id: '6',
          userName: 'Melanie',
          userImageUrl: 'assets/images/avatars/avatar5.jpg',
          text: 'dolor in reprehenderit in voluptate velit esse cillum dolore eu',
          timeAgo: '3d ago',
          likeCount: 86,
        ),
      ],
    );
  }
}
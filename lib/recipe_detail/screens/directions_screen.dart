import 'package:flutter/material.dart';
import '../models/recipe.dart';
import '../models/direction.dart';
import '../widgets/recipe_header.dart';
import '../widgets/direction_item.dart';
import '../utils/constants.dart';

class DirectionsScreen extends StatefulWidget {
  final Recipe recipe;
  
  const DirectionsScreen({
    super.key,
    required this.recipe,
  });

  @override
  State<DirectionsScreen> createState() => _DirectionsScreenState();
}

class _DirectionsScreenState extends State<DirectionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Back button
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
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
                ],
              ),
            ),
            
            // Content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RecipeHeader(
                    recipe: widget.recipe,
                    showAuthor: false,
                  ),
                  const SizedBox(height: 24),
                  
                  // Directions section header
                  const Text(
                    "Langkah-langkah",
                    style: AppTextStyles.subheading,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Ikuti langkah-langkah ini untuk memasak resep ini",
                    style: AppTextStyles.caption,
                  ),
                ],
              ),
            ),
            
            // Directions list
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                itemCount: widget.recipe.directions.length,
                itemBuilder: (context, index) {
                  final direction = widget.recipe.directions[index];
                  return DirectionItem(
                    direction: direction,
                    showCheckbox: true,
                    onChecked: (checked) {
                      setState(() {
                        direction.isCompleted = checked;
                      });
                    },
                  );
                },
              ),
            ),
            
            // Finish button
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Show completion dialog or navigate back to recipe detail
                    _showCompletionDialog(context);
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
                        "Selesai",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.check, size: 16, color: Colors.white),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  void _showCompletionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Selamat!"),
        content: const Text("Anda telah berhasil menyelesaikan resep ini. Apakah Anda ingin berbagi pengalaman Anda?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              Navigator.popUntil(context, (route) => route.isFirst); // Go back to first screen
            },
            child: const Text("Nanti Saja"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              Navigator.popUntil(context, (route) => route.isFirst); // Go back to first screen
              // Show share options or comment section
            },
            child: const Text("Bagikan"),
          ),
        ],
      ),
    );
  }
}
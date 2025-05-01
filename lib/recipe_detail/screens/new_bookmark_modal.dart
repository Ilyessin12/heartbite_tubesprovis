import 'package:flutter/material.dart';
import '../utils/constants.dart';

class NewBookmarkModal extends StatefulWidget {
  final Function(String) onSave;
  
  const NewBookmarkModal({
    Key? key,
    required this.onSave,
  }) : super(key: key);

  @override
  State<NewBookmarkModal> createState() => _NewBookmarkModalState();
}

class _NewBookmarkModalState extends State<NewBookmarkModal> {
  final TextEditingController _nameController = TextEditingController();
  
  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Create new cookbook",
            style: AppTextStyles.heading,
          ),
          const SizedBox(height: 16),
          
          // Name input
          TextField(
            controller: _nameController,
            decoration: InputDecoration(
              hintText: "Title",
              filled: true,
              fillColor: AppColors.cardBackground,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            ),
          ),
          const SizedBox(height: 16),
          
          // Action buttons
          Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: SizedBox(
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_nameController.text.isNotEmpty) {
                        widget.onSave(_nameController.text);
                        Navigator.pop(context);
                      }
                    },
                    child: const Text("Save"),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
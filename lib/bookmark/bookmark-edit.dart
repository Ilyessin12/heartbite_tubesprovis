import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

// Import bottom navigation components
import '../bottomnavbar/bottom-navbar.dart';
import 'bookmark.dart' show BookmarkCategory;

class BookmarkEditScreen extends StatefulWidget{
  final BookmarkCategory category;

  const BookmarkEditScreen({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  State<BookmarkEditScreen> createState() => _BookmarkEditScreenState();
}

class _BookmarkEditScreenState extends State<BookmarkEditScreen>{
  late TextEditingController _nameController;
  final ImagePicker _picker = ImagePicker();
  File? _selectedImage;
  
  @override
  void initState(){
    super.initState();
    _nameController = TextEditingController(text: widget.category.name);
  }

  @override
  void dispose(){
    _nameController.dispose();
    super.dispose();
  }

  void handleBottomNavTap(int index){
    // In a real app, you'd navigate to different screens
    print('Navigated to index: $index');
  }

  void saveChanges(){
    // In a real app, you would update the bookmark in a database or state manager
    // For this example, we'll just go back to the previous screen
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
                      });
                    }
                  }
                  catch(e){
                    print('Error taking photo: $e');
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context){
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
                  'Edit Bookmark',
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
                    height: 200,
                    width: 200,
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
                
                // Name text field
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF0E0E0),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextField(
                    controller: _nameController,
                    style: GoogleFonts.dmSans(
                      fontSize: 16,
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter bookmark name',
                    ),
                  ),
                ),
                
                const SizedBox(height: 40),
                
                // Edit button
                Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: saveChanges,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF8E1616),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Edit',
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
          print('FAB pressed on BookmarkEditScreen');
        },
      ),
    );
  }
}
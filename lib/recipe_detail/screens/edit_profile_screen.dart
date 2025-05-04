import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_back_button.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _nameController = TextEditingController(text: 'Ichsan Simialakama');
  final _usernameController = TextEditingController(text: '@');
  final _emailController = TextEditingController(text: 'ichan.simialakama@example.com');

  @override
  void dispose() {
    _nameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            _buildProfilePicture(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInputField('Nama', _nameController),
                    const SizedBox(height: 16),
                    _buildInputField('Username', _usernameController),
                    const SizedBox(height: 16),
                    _buildInputField('Email', _emailController),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                    style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary, // Ubah warna latar belakang menjadi merah
                    foregroundColor: Colors.white, // Ubah warna teks/ikon menjadi putih
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, // Membuat jarak antara teks dan ikon
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0), // Geser teks ke kanan
                        child: const Text('Simpan'),
                      ),
                      const Icon(Icons.chevron_right, size: 20),
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

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          CustomBackButton(
            onPressed: () => Navigator.pop(context),
          ),
          const Expanded(
            child: Center(
              child: Text(
                'Edit Profile',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          const SizedBox(width: 32), // For balance
        ],
      ),
    );
  }

  // Widget _buildProfilePicture() {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(vertical: 16.0),
  //     child: Center(
  //       child: Stack(
  //         children: [
  //           const CircleAvatar(
  //             radius: 48,
  //             backgroundImage: NetworkImage('https://via.placeholder.com/96'),
  //           ),
  //           Positioned(
  //             bottom: 0,
  //             right: 0,
  //             child: Container(
  //               width: 32,
  //               height: 32,
  //               decoration: const BoxDecoration(
  //                 color: AppColors.primary,
  //                 shape: BoxShape.circle,
  //               ),
  //               child: const Icon(
  //                 Icons.add,
  //                 color: Colors.white,
  //                 size: 20,
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

Widget _buildProfilePicture() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 16.0),
    child: Center(
      child: Stack(
        children: [
          // Foto profil berbentuk kotak dengan radius
          ClipRRect(
            borderRadius: BorderRadius.circular(12), // Radius sudut 12
            child: Image.network(
              'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=240&q=80',
              width: 96,
              height: 96,
              fit: BoxFit.cover,
            ),
          ),
          // Tombol tambah di kanan bawah
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: 32,
              height: 32,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.edit,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}




  Widget _buildInputField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.grayLight,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
          ),
        ),
      ],
    );
  }
}

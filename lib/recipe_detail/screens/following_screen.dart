import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_back_button.dart';
import '../widgets/user_list_item.dart';

class FollowingScreen extends StatelessWidget {
  const FollowingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> followingUsers = [
      {
        'name': 'Sandy Chase',
        'username': '@sandychase',
        'avatarUrl': 'https://avatar.iran.liara.run/public',
      },
      {
        'name': 'Eleanor Langdon',
        'username': '@eleanorlan',
        'avatarUrl': 'https://avatar.iran.liara.run/public',
      },
      {
        'name': 'Salid Snake',
        'username': '@salidsnake',
        'avatarUrl': 'https://avatar.iran.liara.run/public',
      },
      {
        'name': 'Zidan Hadid',
        'username': '@zidanhadid',
        'avatarUrl': 'https://avatar.iran.liara.run/public',
      },
      {
        'name': 'Kevin Sanjaya',
        'username': '@kevinsanjaya',
        'avatarUrl': 'https://avatar.iran.liara.run/public',
      },
      {
        'name': 'I AM STEVE',
        'username': '@steve',
        'avatarUrl': 'https://avatar.iran.liara.run/public',
      },
    ];

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            Expanded(
              child: ListView.builder(
                itemCount: followingUsers.length,
                itemBuilder: (context, index) {
                  final user = followingUsers[index];
                  return UserListItem(
                    name: user['name'],
                    username: user['username'],
                    avatarUrl: user['avatarUrl'],
                    onFollowTap: () {},
                  );
                },
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
                'Following',
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
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color primaryRed = const Color(0xFF8E1616);
    
    // Sample notification data
    final List<Map<String, dynamic>> recentNotifications = [
      {
        'name': 'Fernandez',
        'action': 'loved your recipes',
        'time': '23 mins ago',
        'hasImage': true,
        'hasMultipleImages': false,
        'hasFollowButton': false,
      },
      {
        'name': 'Amanda',
        'action': 'has follow you back',
        'time': '2 hours ago',
        'hasImage': false,
        'hasMultipleImages': false,
        'hasFollowButton': false,
      },
      {
        'name': 'Michale',
        'action': 'review your recipe:',
        'subtext': 'I\'ve tried it and it\'s delicious!',
        'time': '4 hours ago',
        'hasImage': true,
        'hasMultipleImages': false,
        'hasFollowButton': false,
      },
    ];
    
    final List<Map<String, dynamic>> olderNotifications = [
      {
        'name': 'Patricia',
        'action': 'has posted her new recipe',
        'time': '1 day ago',
        'hasImage': true,
        'hasMultipleImages': false,
        'hasFollowButton': false,
      },
      {
        'name': 'Fernandez',
        'action': 'has updated his recipe\'s gallery',
        'time': '1 day ago',
        'hasImage': false,
        'hasMultipleImages': true,
        'hasFollowButton': false,
      },
      {
        'name': 'Charles Walker',
        'action': 'is now following you',
        'time': '2 days ago',
        'hasImage': false,
        'hasMultipleImages': false,
        'hasFollowButton': true,
      },
      {
        'name': 'Antonio',
        'action': 'loved your recipes',
        'time': '23 mins ago',
        'hasImage': true,
        'hasMultipleImages': false,
        'hasFollowButton': false,
      },
      {
        'name': 'Fernandez',
        'action': 'has updated his recipe\'s gallery',
        'time': '1 day ago',
        'hasImage': false,
        'hasMultipleImages': true,
        'hasFollowButton': false,
      },
    ];
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // App bar with back button and title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: Row(
                children: [
                  // Back button in red circle
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: primaryRed,
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.arrow_back,
                        size: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  
                  const SizedBox(width: 24),
                  
                  // Title
                  Text(
                    'Notifikasi',
                    style: GoogleFonts.dmSans(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            
            // Notification list
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                children: [
                  // Recent section
                  const SizedBox(height: 24),
                  Text(
                    'Recent',
                    style: GoogleFonts.dmSans(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  // Recent notifications
                  ...recentNotifications.map((notification) => 
                    _buildNotificationItem(notification)
                  ).toList(),
                  
                  // Older notifications section
                  const SizedBox(height: 32),
                  Text(
                    'Older Notifications',
                    style: GoogleFonts.dmSans(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  // Older notifications
                  ...olderNotifications.map((notification) => 
                    _buildNotificationItem(notification)
                  ).toList(),
                  
                  // Bottom padding
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildNotificationItem(Map<String, dynamic> notification) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile picture
          CircleAvatar(
            radius: 24,
            backgroundColor: Colors.grey[200],
            backgroundImage: const AssetImage('assets/images/avatars/avatar1.jpg'),
          ),
          
          const SizedBox(width: 12),
          
          // Notification content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name and action
                RichText(
                  text: TextSpan(
                    style: GoogleFonts.dmSans(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: notification['name'],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: ' ${notification['action']}',
                      ),
                    ],
                  ),
                ),
                
                // Subtext if available
                if (notification.containsKey('subtext'))
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      notification['subtext'],
                      style: GoogleFonts.dmSans(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                
                // Multiple images for gallery updates
                if (notification['hasMultipleImages'])
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      children: List.generate(3, (index) => 
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              'assets/images/cookbooks/cake.jpg',
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      ),
                    ),
                  ),
                
                // Time
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    notification['time'],
                    style: GoogleFonts.dmSans(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(width: 12),
          
          // Right side content (food image or follow button)
          if (notification['hasImage'])
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/cookbooks/chicken.jpg',
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            )
          else if (notification['hasFollowButton'])
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.person_add,
                size: 20,
                color: Colors.black54,
              ),
            ),
        ],
      ),
    );
  }
}

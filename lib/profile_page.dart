// File: lib/profile_page.dart
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String fullName;
  final String email;

  const ProfilePage({super.key, required this.fullName, required this.email});

  @override
  Widget build(BuildContext context) {
    // Set the same background color as Sign In/Sign Up
    const backgroundColor = Color(0xFFF5F5F5); // Replace with your exact color

    return Scaffold(
      backgroundColor: backgroundColor, // Full-screen background color
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text('My Profile'),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: backgroundColor, // Match the page color
        elevation: 0,
        centerTitle: false, // Align title to the left
        foregroundColor: Colors.black, // Ensure icons/text are visible
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Avatar and Info
            Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/facebook.png'), // Replace with user photo
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      fullName,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const Text(
                      'Active Citizen',
                      style: TextStyle(fontSize: 14, color: Colors.green),
                    ),
                    const Text(
                      'Joined 2022',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),

            // Dashboard & Other Options
            _buildListTile(context, 'Dashboard'),
            _buildListTile(context, 'Account Details'),
            _buildListTile(context, 'Edit Profile'),
            _buildListTile(context, 'Reporting History'),
            _buildListTile(context, 'Settings'),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: backgroundColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.green),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people, color: Colors.green),
            label: 'Engage',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.black),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications, color: Colors.green),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add, color: Colors.green),
            label: 'Post',
          ),
        ],
        currentIndex: 2, // Profile is active
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(context, '/home');
              break;
            case 1:
              Navigator.pushReplacementNamed(context, '/engage');
              break;
            case 2:
              Navigator.pushReplacementNamed(context, '/profile');
              break;
            case 3:
              Navigator.pushReplacementNamed(context, '/notifications');
              break;
            case 4:
              Navigator.pushReplacementNamed(context, '/post');
              break;
          }
        },
      ),
    );
  }

  ListTile _buildListTile(BuildContext context, String title) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontSize: title == 'Dashboard' || title == 'Account Details' ? 18 : 16,
          fontWeight: title == 'Dashboard' || title == 'Account Details'
              ? FontWeight.w600
              : FontWeight.normal,
          color: Colors.black,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward, color: Colors.grey),
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("$title coming soon")),
        );
      },
    );
  }
}

// File: lib/profile_page.dart
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Avatar and Info
            Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/avatar.png'), // Replace with user photo
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Mr Dedan',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const Text(
                      'Active Citizen',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.green,
                      ),
                    ),
                    const Text(
                      'Joined 2022',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 32),

            // Dashboard
            ListTile(
              title: const Text(
                'Dashboard',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              trailing: const Icon(Icons.arrow_forward, color: Colors.grey),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Dashboard coming soon")),
                );
              },
            ),

            // Account Details
            ListTile(
              title: const Text(
                'Account Details',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              trailing: const Icon(Icons.arrow_forward, color: Colors.grey),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Account Details coming soon")),
                );
              },
            ),

            // Edit Profile
            ListTile(
              title: const Text(
                'Edit Profile',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              trailing: const Icon(Icons.arrow_forward, color: Colors.grey),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Edit Profile coming soon")),
                );
              },
            ),

            // Reporting History
            ListTile(
              title: const Text(
                'Reporting History',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              trailing: const Icon(Icons.arrow_forward, color: Colors.grey),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Reporting History coming soon")),
                );
              },
            ),

            // Settings
            ListTile(
              title: const Text(
                'Settings',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              trailing: const Icon(Icons.arrow_forward, color: Colors.grey),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Settings coming soon")),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
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
          if (index == 0) {
            Navigator.pushReplacementNamed(context, '/home');
          } else if (index == 1) {
            Navigator.pushReplacementNamed(context, '/engage');
          } else if (index == 2) {
            Navigator.pushReplacementNamed(context, '/profile');
          } else if (index == 3) {
            Navigator.pushReplacementNamed(context, '/notifications');
          } else if (index == 4) {
            Navigator.pushReplacementNamed(context, '/post');
          }
        },
      ),
    );
  }
}
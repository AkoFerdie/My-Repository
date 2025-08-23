// File: lib/getting_started_page.dart
import 'package:flutter/material.dart';
import 'second_page.dart'; // Keep this — it's correct

class GettingStartedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header Image
            Container(
              height: 300,
              width: double.infinity,
              child: Image.asset(
                'assets/Picture2.png',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),

            SizedBox(height: 40),

            // Logo
            Center(
              child: Image.asset(
                'assets/front_logo.png',
                width: 80,
                height: 80,
                color: Colors.green,
              ),
            ),

            SizedBox(height: 24),

            // Title
            Text(
              'Keep It Clean',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),

            SizedBox(height: 16),

            // Subtitle
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Report waste issues and\njoin cleanup efforts',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                  height: 1.4,
                ),
              ),
            ),

            SizedBox(height: 40), // Replaces Spacer() with fixed spacing

            // Get Started Button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF4CAF50),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondPage()),
                  );
                },
                child: Text(
                  'Get Started',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),

            SizedBox(height: 30), // Optional: space at the bottom
          ],
        ),
      ),
    );
  }
}
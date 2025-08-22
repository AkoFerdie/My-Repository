// getting_started_page.dart
import 'package:flutter/material.dart';
import 'second_page.dart'; // Now imported here — where it's used

class GettingStartedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
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
          Text(
            'Report waste issues and\njoin cleanup efforts',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade600,
              height: 1.4,
            ),
          ),

          Spacer(),

          // Get Started Button
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              width: double.infinity,
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
                  //  Now this works — SecondPage is imported above
                  Navigator.push(
                    context,
                    // Navigate to second page here
                    MaterialPageRoute(builder: (context) => SecondPage()),
                  );
                },
                child: Text(
                  'Get Started',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),

          SizedBox(height: 30),
        ],
      ),
    );
  }
}

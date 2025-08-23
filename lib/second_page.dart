// File: lib/second_page.dart
import 'package:flutter/material.dart';
import 'third_page.dart'; // Import ThirdPage
import 'fourth_page.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // === BACKGROUND GREEN CURVES (All 4 Corners) ===
          _buildTopLeftCurve(),
          _buildTopRightCurve(),
          _buildBottomLeftCurve(),
          _buildBottomRightCurve(),

          // === MAIN CONTENT ===
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Logo
                Image.asset(
                  'assets/front_logo.png',
                  width: 100,
                  height: 100,
                  color: Colors.green,
                ),
                SizedBox(height: 32),

                // Title
                Text(
                  'Keep It Clean',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 20),

                // Subtitle
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Text(
                    'Tackling the pressing issues of dirty roads\nand neighborhoods in order to create a friendly environment!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                      height: 1.4,
                    ),
                  ),
                ),
                SizedBox(height: 40),

                // Sign In Button
                SizedBox(
                  width: 240,
                  height: 52,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF4CAF50),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 2,
                      padding: EdgeInsets.symmetric(vertical: 16),
                    ),
                    onPressed: () {
                      // ✅ Navigate to ThirdPage (Sign In screen)
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ThirdPage()),
                      );
                    },
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
// Sign Up Button
SizedBox(
  width: 240,
  height: 52,
  child: OutlinedButton(
    style: OutlinedButton.styleFrom(
      side: BorderSide(color: Color(0xFF4CAF50)),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.symmetric(vertical: 16),
    ),
    onPressed: () {
      // ✅ FIXED: Navigate to FourthPage
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FourthPage()),
      );
    },
    child: Text(
      'Sign up',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Color(0xFF4CAF50),
      ),
    ),
  ),
),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper: Top Left Curve
  Widget _buildTopLeftCurve() {
    return Positioned(
      top: -80,
      left: -100,
      child: Container(
        width: 300,
        height: 180,
        decoration: BoxDecoration(
          color: Color(0xFF4CAF50),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(200),
            bottomRight: Radius.circular(200),
          ),
        ),
      ),
    );
  }

  // Helper: Top Right Curve
  Widget _buildTopRightCurve() {
    return Positioned(
      top: -80,
      right: -100,
      child: Container(
        width: 300,
        height: 180,
        decoration: BoxDecoration(
          color: Color(0xFF4CAF50),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(200),
            bottomRight: Radius.circular(200),
          ),
        ),
      ),
    );
  }

  // Helper: Bottom Left Curve
  Widget _buildBottomLeftCurve() {
    return Positioned(
      bottom: -80,
      left: -100,
      child: Container(
        width: 300,
        height: 180,
        decoration: BoxDecoration(
          color: Color(0xFF4CAF50),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(200),
            topRight: Radius.circular(200),
          ),
        ),
      ),
    );
  }

  // Helper: Bottom Right Curve
  Widget _buildBottomRightCurve() {
    return Positioned(
      bottom: -80,
      right: -100,
      child: Container(
        width: 300,
        height: 180,
        decoration: BoxDecoration(
          color: Color(0xFF4CAF50),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(200),
            topRight: Radius.circular(200),
          ),
        ),
      ),
    );
  }
}

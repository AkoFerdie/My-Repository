// File: lib/third_page.dart
import 'package:flutter/material.dart';
import 'fourth_page.dart';
import 'forgot_password_page.dart';

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double maxWidth = 400;
    final double horizontalPadding = 20;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF4CAF50)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Back', style: TextStyle(color: Color(0xFF4CAF50))),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/Change.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.zero,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: maxWidth),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Logo
                    Image.asset(
                      'assets/front_logo.png',
                      width: 80,
                      height: 80,
                      color: const Color(0xFF4CAF50),
                    ),
                    const SizedBox(height: 12),

                    // App Title
                    const Text(
                      'Keep It Clean',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4CAF50),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Page Title
                    const Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF4CAF50),
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Email Field
                    SizedBox(
                      width: double.infinity,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Email or Username',
                          labelStyle: const TextStyle(fontSize: 14),
                          prefixIcon: const Icon(
                            Icons.person,
                            size: 18,
                            color: Color(0xFF4CAF50),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Color(0xFF4CAF50),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Color(0xFF4CAF50),
                              width: 2,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Color(0xFF4CAF50),
                            ),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 12,
                          ),
                        ),
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Password Field
                    SizedBox(
                      width: double.infinity,
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: const TextStyle(fontSize: 14),
                          prefixIcon: const Icon(
                            Icons.lock,
                            size: 18,
                            color: Color(0xFF4CAF50),
                          ),
                          suffixIcon: const Icon(
                            Icons.visibility,
                            size: 18,
                            color: Color(0xFF4CAF50),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Color(0xFF4CAF50),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Color(0xFF4CAF50),
                              width: 2,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Color(0xFF4CAF50),
                            ),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 12,
                          ),
                        ),
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Forgot Password?
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgotPasswordPage()),
                          );
                        },
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                              fontSize: 14, color: Color(0xFF4CAF50)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Sign In Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4CAF50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Signed In!")),
                          );
                        },
                        child: const Text(
                          'Sign In',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // OR Divider
                    Row(
                      children: [
                        Expanded(
                          child: Divider(color: Colors.grey[300], thickness: 1),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            'OR',
                            style: TextStyle(color: Colors.grey, fontSize: 13),
                          ),
                        ),
                        Expanded(
                          child: Divider(color: Colors.grey[300], thickness: 1),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Social Buttons
                    _buildSocialButton(
                      context,
                      'Continue with Google',
                      'assets/google.png',
                      alignLeft: true,
                    ),
                    const SizedBox(height: 10),
                    _buildSocialButton(
                      context,
                      'Continue with Facebook',
                      'assets/facebook.png',
                      alignLeft: false,
                    ),

                    // ✅ Extra space before "Sign Up" section
                    const SizedBox(height: 30),

                    // Don't have an account? Sign Up
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account? ",
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FourthPage(),
                              ),
                            );
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Color(0xFF4CAF50),
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 0),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton(
    BuildContext context,
    String label,
    String iconPath, {
    bool alignLeft = false,
    double iconPadding = 75.0,
  }) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: const Color(0xFF4CAF50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
        onPressed: () {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("$label pressed")));
        },
        child: Row(
          mainAxisAlignment:
              alignLeft ? MainAxisAlignment.start : MainAxisAlignment.center,
          children: [
            if (alignLeft)
              SizedBox(width: iconPadding),
            Image.asset(iconPath, width: 30, height: 30, fit: BoxFit.contain),
            const SizedBox(width: 10),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

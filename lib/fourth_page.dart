// File: lib/fourth_page.dart
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'third_page.dart';

class FourthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double maxWidth = 400;
    final double horizontalPadding = 20;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF4CAF50)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Back',
          style: TextStyle(color: Color(0xFF4CAF50)),
        ),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Column(
              children: [
                const SizedBox(height: kToolbarHeight + 20),

                // Logo
                Image.asset(
                  'assets/front_logo.png',
                  width: 60,
                  height: 60,
                  color: const Color(0xFF4CAF50),
                ),
                const SizedBox(height: 8),

                // App Title
                const Text(
                  'Keep It Clean',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4CAF50),
                  ),
                ),
                const SizedBox(height: 10),

                // Page Title
                const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF4CAF50),
                  ),
                ),
                const SizedBox(height: 16),

                // Spacer pushes form down but keeps fit
                const Spacer(),

                // Full Name
                _buildTextField(label: "Full Name", icon: Icons.person),
                const SizedBox(height: 8),

                // Email
                _buildTextField(label: "Email", icon: Icons.email),
                const SizedBox(height: 8),

                // Password
                _buildTextField(
                  label: "Password",
                  icon: Icons.lock,
                  isPassword: true,
                ),
                const SizedBox(height: 8),

                // Confirm Password
                _buildTextField(
                  label: "Confirm Password",
                  icon: Icons.lock,
                  isPassword: true,
                ),
                const SizedBox(height: 12),

                // Agreement
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Transform.scale(
                      scale: 0.7,
                      child: Checkbox(
                        value: false,
                        onChanged: (bool? value) {},
                        activeColor: const Color(0xFF4CAF50),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    ),
                    Flexible(
                      child: Text.rich(
                        TextSpan(
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.black87,
                          ),
                          children: [
                            const TextSpan(text: 'I agree to the '),
                            TextSpan(
                              text: 'terms',
                              style: const TextStyle(
                                color: Color(0xFF4CAF50),
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text("Terms of Use clicked")),
                                  );
                                },
                            ),
                            const TextSpan(text: ' and '),
                            TextSpan(
                              text: 'privacy policy',
                              style: const TextStyle(
                                color: Color(0xFF4CAF50),
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text("Privacy Policy clicked")),
                                  );
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                // Sign Up Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4CAF50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Signed Up!")),
                      );
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                // Reduced bottom spacer to bring Sign In text up
                const SizedBox(height: 20),

                // Already have an account?
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account?",
                      style: TextStyle(fontSize: 15, color: Colors.black87),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => ThirdPage()),
                        );
                      },
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                          color: Color(0xFF4CAF50),
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Reusable textfield builder
  static Widget _buildTextField(
      {required String label, required IconData icon, bool isPassword = false}) {
    return SizedBox(
      width: double.infinity,
      child: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(fontSize: 12),
          prefixIcon: Icon(icon, size: 18, color: Color(0xFF4CAF50)),
          suffixIcon: isPassword
              ? const Icon(Icons.visibility, size: 18, color: Color(0xFF4CAF50))
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFF4CAF50)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFF4CAF50), width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFF4CAF50)),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
        ),
        style: const TextStyle(fontSize: 12),
      ),
    );
  }
}

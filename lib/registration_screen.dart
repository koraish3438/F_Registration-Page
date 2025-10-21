// lib/registration_screen.dart
import 'package:flutter/material.dart';
import 'package:ui_screen/login_screen.dart'; // ✅ FIXED: Must import login_screen.dart

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  // Helper function to build customized TextFields
  Widget _buildTextField({
    required String label,
    required IconData icon,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
    bool isPassword = false,
  }) {
    return TextFormField(
      keyboardType: keyboardType,
      obscureText: isPassword, // Hides text for password fields
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon, color: Colors.deepPurple),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Account", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      // SingleChildScrollView allows the screen content to scroll if the keyboard opens or screen is small
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Title and Subtitle
              const Text(
                "Create Account",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Quickly set up your new profile!",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),

              const SizedBox(height: 40),

              // Form Fields
              Form(
                child: Column(
                  children: <Widget>[
                    _buildTextField(label: "Full Name", icon: Icons.person_outline, hint: "Enter your full name"),
                    const SizedBox(height: 20),
                    _buildTextField(label: "Email", icon: Icons.email_outlined, hint: "Enter your email address", keyboardType: TextInputType.emailAddress),
                    const SizedBox(height: 20),
                    _buildTextField(label: "Password", icon: Icons.lock_outline, hint: "Enter your password", isPassword: true),
                    const SizedBox(height: 20),
                    _buildTextField(label: "Confirm Password", icon: Icons.lock_reset_outlined, hint: "Re-enter your password", isPassword: true),
                    const SizedBox(height: 40),

                    // Sign Up Button
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: () {
                          // TODO: Implement Sign Up logic here
                          debugPrint("Sign Up Button Pressed");
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          elevation: 5,
                        ),
                        child: const Text(
                          "SIGN UP",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // "Already have an account? Login" TextButton
              Center(
                child: TextButton(
                  onPressed: () {
                    // Navigate to the LoginScreen
                    Navigator.push(
                      context,
                      // ✅ FIXED: Removed const from const LoginScreen() to fix "Not a constant expression" error
                      MaterialPageRoute(builder: (context) => const LoginScreen()),
                    );
                  },
                  child: const Text.rich(
                    TextSpan(
                      text: "Already have an account? ",
                      style: TextStyle(color: Colors.grey),
                      children: [
                        TextSpan(
                          text: "Login",
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
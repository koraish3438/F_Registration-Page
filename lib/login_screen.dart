// lib/login_screen.dart
import 'package:flutter/material.dart';
import 'package:ui_screen/registration_screen.dart'; // ✅ Corrected import for your project

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
      obscureText: isPassword,
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
        title: const Text("Login", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        // Removes the back button if we want a clean authentication flow
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Title and Subtitle
              const Text(
                "Welcome Back!",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Sign in to continue your journey.",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),

              const SizedBox(height: 40),

              // Form Fields
              Form(
                child: Column(
                  children: <Widget>[
                    // Email Field
                    _buildTextField(
                      label: "Email",
                      icon: Icons.email_outlined,
                      hint: "Enter your email address",
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 20),

                    // Password Field
                    _buildTextField(
                      label: "Password",
                      icon: Icons.lock_outline,
                      hint: "Enter your password",
                      isPassword: true,
                    ),

                    // Forgot Password Button (Right Aligned)
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          // TODO: Implement Forgot Password navigation/dialog
                          debugPrint("Forgot Password Pressed");
                        },
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Login Button
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: () {
                          // TODO: Implement Login logic here
                          debugPrint("Login Button Pressed");
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          elevation: 5,
                        ),
                        child: const Text(
                          "LOGIN",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // "Don't have an account? Sign Up" TextButton
              Center(
                child: TextButton(
                  onPressed: () {
                    // Navigate to the RegistrationScreen (we use push replacement for a cleaner flow)
                    Navigator.pushReplacement(
                      context,
                      // The const in front of RegistrationScreen() is technically fine here,
                      // but removing it is safer to avoid the "Not a constant expression" error.
                      MaterialPageRoute(builder: (context) => const RegistrationScreen()),
                    );
                  },
                  child: const Text.rich(
                    TextSpan(
                      text: "Don't have an account? ",
                      style: TextStyle(color: Colors.grey),
                      children: [
                        TextSpan(
                          text: "Sign Up",
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
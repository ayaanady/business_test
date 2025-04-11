import 'package:flutter/material.dart';
import 'choose_for_patient.dart';
import 'login.dart'; 

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              IconButton(
                icon: Icon(Icons.arrow_back, color: Color(0xFF1F5382)),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
          
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 10.0),
                child: Center(
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 24,
                      color: Color(0xFF1F5382),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                
                      Text(
                        "Name",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF1F5382),
                        ),
                      ),
                      const SizedBox(height: 8),
                      _buildTextField(Icons.person, "Enter Your Name"),
                      const SizedBox(height: 20),
                      // حقل "Email Address"
                      Text(
                        "Email Address",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF1F5382),
                        ),
                      ),
                      const SizedBox(height: 8),
                      _buildTextField(Icons.email, "Enter Your email address"),
                      const SizedBox(height: 20),
                      // حقل "Password"
                      Text(
                        "Password",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF1F5382),
                        ),
                      ),
                      const SizedBox(height: 8),
                      _buildTextField(Icons.lock, "Enter Your password", obscureText: true),
                      const SizedBox(height: 20),
                      // حقل "Confirm Password"
                      Text(
                        "Confirm password",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF1F5382),
                        ),
                      ),
                      const SizedBox(height: 8),
                      _buildTextField(Icons.lock, "Enter Your password", obscureText: true),
                      const SizedBox(height: 30),
                      // زر "Save & Continue"
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ChooseForPatientScreen()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF1F5382),
                            padding: EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25), 
                            ),
                          ),
                          child: const Text(
                            "Save & Continue",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                     
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account? ",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => LoginScreen()),
                                );
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero, 
                                minimumSize: Size(0, 0),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap, 
                              ),
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF1F5382),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(IconData icon, String hint, {bool obscureText = false}) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.grey[400]),
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey[400]),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Color(0xFF1F5382)),
        ),
      ),
    );
  }
}
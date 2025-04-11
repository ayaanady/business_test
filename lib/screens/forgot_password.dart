import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 253, 253, 253),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF1F5382)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/forgot.png', height: 200),
            SizedBox(height: 20),
            Text(
              "Forget Password",
              style: TextStyle(
                fontSize: 24,
                color: Color(0xFF1F5382), 
              
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Please enter your email address",
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            SizedBox(height: 20),
      
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Email",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF1F5382),
                  
                ),
              ),
            ),
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email, color: Color(0xFF1F5382)),
                hintText: "Enter Your Email Address",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.grey[300]!, 
                    width: 1.0,
                  ),
                ),
               
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.grey[300]!,
                    width: 1.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.grey[300]!, 
                    width: 1.0,
                  ),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 40), 
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/check_email');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1F5382),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: Text(
                  "Submit",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
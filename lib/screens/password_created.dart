import 'package:flutter/material.dart';

class PasswordSuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 249, 249, 249),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/created.png',
                height: 200), 
            SizedBox(height: 20),
            Text(
              "Password created successfully!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color:Color(0xFF1F5382) ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                      context, '/login'); 
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1F5382),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: Text("Go to Login",
                    style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

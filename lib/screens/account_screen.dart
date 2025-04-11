import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, 
      appBar: AppBar(
        title: Text(
          'Account Settings',
          style: TextStyle(
            color: Color(0xFF1F5382), 
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white, 
        elevation: 0, 
        iconTheme: IconThemeData(color: Color(0xFF1F5382)), 
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Edit your account details',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F5382), 
              ),
            ),
            SizedBox(height: 20),
            _customButton('Change Profile Picture & Name', () {
             
            }),
            SizedBox(height: 10),
            _customButton('Change Password', () {
          
            }),
            SizedBox(height: 10),
            _customButton('Logout', () {
            
            }),
          ],
        ),
      ),
    );
  }

  Widget _customButton(String text, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white, 
        foregroundColor: Color(0xFF1F5382), 
        side: BorderSide(color: Color(0xFF1F5382)), 
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(text),
    );
  }
}

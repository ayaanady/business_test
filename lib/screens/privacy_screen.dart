import 'package:flutter/material.dart';

class PrivacyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Privacy Settings')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Manage your privacy settings', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
              
              },
              child: Text('Manage Privacy'),
            ),
            ElevatedButton(
              onPressed: () {
            
              },
              child: Text('Privacy Policy'),
            ),
          ],
        ),
      ),
    );
  }
}

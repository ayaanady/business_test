import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About App')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('App Version: 1.0.0', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('© 2025 Your Company', style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                
              },
              child: Text('Visit Our Website'),
            ),
          ],
        ),
      ),
    );
  }
}

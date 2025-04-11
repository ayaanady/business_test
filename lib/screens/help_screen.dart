import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Help & Support')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('How can we help you?', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
               
              },
              child: Text('FAQs'),
            ),
            ElevatedButton(
              onPressed: () {
            
              },
              child: Text('Contact Support'),
            ),
            ElevatedButton(
              onPressed: () {
           
              },
              child: Text('Send Inquiry'),
            ),
          ],
        ),
      ),
    );
  }
}

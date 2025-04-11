import 'package:flutter/material.dart';

class SecurityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Security Settings')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Security Options', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
               
              },
              child: Text('Enable 2FA'),
            ),
            ElevatedButton(
              onPressed: () {
             
              },
              child: Text('Manage Devices'),
            ),
            ElevatedButton(
              onPressed: () {
               
              },
              child: Text('Reset Password'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'onboarding_screen2.dart';
import 'welcome.dart';

class OnboardingScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFF1F5382),
      body: Stack(
        children: [
      
          Positioned.fill(
            child: CustomPaint(
              painter: WavePainter(),
            ),
          ),
        
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Image.asset(
              "assets/images/cuate.png",
              width: screenWidth - 80,
              height: (screenHeight * 0.35),
              fit: BoxFit.contain,
            ),
          ),
       
          Positioned(
            top: 20,
            right: 20, 
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => WelcomeScreen()),
                );
              },
              child: Text(
                "Skip",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        
          Positioned(
            bottom: 120,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 35,
                      height: 3,
                      color:  Color(0xFF1F5382), 
                    ),
                    SizedBox(width: 5),
                    Container(
                      width: 35,
                      height: 3,
                      color: Colors.grey[600], 
                    ),
                  ],
                ),
                SizedBox(height: 10),
              
                Text(
                  "Chat AI",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F5382), 
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
        
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text(
                    "Got a question about your dental health or appointment? Chat with our AI assistant anytime, just like talking to a dental expert.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              ],
            ),
          ),
    
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Center(
              child: SizedBox(
                width: 150,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OnboardingScreen2()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF1F5382), 
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Text(
                    "Next",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, size.height * 0.35); 

    // المنحنى الأول
    path.quadraticBezierTo(
      size.width * 0.20,
      size.height * 0.8, 
      size.width * 0.35, 
      size.height * 0.48, 
    );

    // المنحنى الثاني
    path.quadraticBezierTo(
      size.width * 0.45, 
      size.height * 0.8, 
      size.width * 0.66, 
      size.height * 0.48, 
    );


    path.quadraticBezierTo(
      size.width * 0.8, 
      size.height * 0.8, 
      size.width * 1.0, 
      size.height * 0.45, 
    );

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
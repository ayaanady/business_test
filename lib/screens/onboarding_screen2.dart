import 'package:flutter/material.dart';

class OnboardingScreen2 extends StatelessWidget {
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
              "assets/images/comm.png",
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
                Navigator.pushNamed(context, "/welcome");
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
            bottom: 75, 
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 10), 
              
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 35,
                      height: 3,
                      color: Colors.grey[500],
                    ),
                    SizedBox(width: 5),
                    Container(
                      width: 35,
                      height: 3,
                      color: const  Color(0xFF1F5382),
                    ),
                  ],
                ),
                SizedBox(height: 10),
             
                Text(
                  "Community Tools",
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
                    "Save money by buying pre-owned tools from your peers or sell what you no longer need easily with Community Tools.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600], 
                    ),
                  ),
                ),
            
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.local_hospital, 
                      color: Colors.white,
                      size: 24,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Dental",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5), 
              ],
            ),
          ),
 
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Center(
              child: SizedBox(
                width: 130,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/welcome");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF1F5382), 
                    foregroundColor: Colors.white, 
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 5,
                  ),
                  child: Text(
                    "Next",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
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
    path.moveTo(0, size.height *0.45); 


    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.65, 
      size.width * 0.4,
      size.height * 0.55,
    );
    // المنحنى الثاني
    path.quadraticBezierTo(
      size.width * 0.55,
      size.height * 0.70, 
      size.width * 0.7,
      size.height * 0.55,
    );
    // المنحنى الثالث
    path.quadraticBezierTo(
      size.width * 0.85,
      size.height * 0.65, 
      size.width * 1.0,
      size.height * 0.55,
    );

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
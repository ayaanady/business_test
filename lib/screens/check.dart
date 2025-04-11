import 'package:flutter/material.dart';

class CheckEmailScreen extends StatefulWidget {
  @override
  _CheckEmailScreenState createState() => _CheckEmailScreenState();
}

class _CheckEmailScreenState extends State<CheckEmailScreen> {

  List<TextEditingController> controllers =
      List.generate(4, (index) => TextEditingController());
  List<FocusNode> focusNodes = List.generate(4, (index) => FocusNode());


  void resetCodeFields() {
    for (var controller in controllers) {
      controller.clear(); 
    }
    FocusScope.of(context).requestFocus(focusNodes[0]); 
  }

  @override
  void dispose() {
   
    for (var controller in controllers) {
      controller.dispose();
    }
    for (var focusNode in focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
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
            Image.asset('assets/images/check.png', height: 200),
            SizedBox(height: 20),
            Text(
              "Check your email",
              style: TextStyle(
                fontSize: 24,
                color: Color(0xFF1F5382),
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "We've sent the code to your email",
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            SizedBox(height: 20),

        
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  width: 50,
                  height: 50,
                  child: TextField(
                    controller: controllers[index],
                    focusNode: focusNodes[index], 
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    decoration: InputDecoration(
                      counterText: "", 
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Color(0xFF1F5382),
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    onChanged: (value) {
                    
                      if (value.length == 1 && index < 3) {
                        FocusScope.of(context).requestFocus(focusNodes[index + 1]);
                      }
                    },
                  ),
                );
              }),
            ),

            SizedBox(height: 20),
            Text(
              "Code expires in 03:12",
              style: TextStyle(fontSize: 14, color: Colors.red),
            ),

            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/reset_password');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1F5382),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "Verify",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),

            SizedBox(height: 10),
            
            SizedBox(
              width: double.infinity, 
              height: 50,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xFF1F5382),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextButton(
                  onPressed: () {
                    resetCodeFields(); 
                  },
                  child: Text(
                    "Send again",
                    style: TextStyle(
                      color: Color(0xFF1F5382),
                      fontSize: 18, 
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'upload.dart';
import 'health_history.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String gender = "";
  String bookingType = "Normal";
  bool brushTeeth = false;
  bool smoke = false;
  int timesBrushing = 0;
  int cigarettesPerDay = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF1F5382)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const SizedBox(), 
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Text(
                  "Registration",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F5382),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),

            _buildLabeledTextField("Full Name *", "Enter Your Name", isRequired: true),
            const SizedBox(height: 20), // زيادة المسافة بين الحقول
            _buildLabeledTextField("Phone Number *", "Enter Your Phone", isRequired: true),
            const SizedBox(height: 20),
            _buildLabeledTextField("National ID *", "Enter Your National ID Number", isRequired: true),
            const SizedBox(height: 20),
            _buildLabeledTextField("Age *", "Enter Your Age", isRequired: true),
            const SizedBox(height: 20),
            _buildLabeledTextField("Address", "Enter Your Address"),
            const SizedBox(height: 20),

            _buildTitle("Select your Gender *"),
            Row(
              children: [
                _buildRadioButton("Male", "Male", group: "gender"),
                _buildRadioButton("Female", "Female", group: "gender"),
              ],
            ),
            const SizedBox(height: 20),

            _buildTitle("Select your Booking *"),
            Row(
              children: [
                _buildRadioButton("Normal", "Normal", group: "booking"),
                _buildRadioButton("VIP", "VIP", group: "booking"),
              ],
            ),
            const SizedBox(height: 20),

            _buildTitle("Do you brush your teeth?"),
            Row(
              children: [
                _buildCheckbox("Yes", true),
                _buildCheckbox("No", false),
              ],
            ),
            const SizedBox(height: 20),

            _buildCounter("How many times a day?", timesBrushing, (val) {
              setState(() {
                timesBrushing = val;
              });
            }),
            const SizedBox(height: 20),

            _buildTitle("Do you smoke?"),
            Row(
              children: [
                _buildCheckbox("Yes", true, isSmoking: true),
                _buildCheckbox("No", false, isSmoking: true),
              ],
            ),
            const SizedBox(height: 20),

            _buildCounter("How many cigarettes a day?", cigarettesPerDay, (val) {
              setState(() {
                cigarettesPerDay = val;
              });
            }),
            const SizedBox(height: 20),

            _buildUploadField("Upload", () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => UploadScreen()));
            }),
            const SizedBox(height: 10),

            _buildButton("Next", Color(0xFF1F5382), () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => HealthHistoryScreen()));
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Color(0xFF1F5382),
        ),
      ),
    );
  }

  Widget _buildLabeledTextField(String label, String hint, {bool isRequired = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1F5382),
                ),
              ),
              if (isRequired)
                Text(
                  " *",
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
            ],
          ),
          const SizedBox(height: 5),
          TextFormField(
            decoration: InputDecoration(
              hintText: hint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey),
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRadioButton(String label, String value, {required String group}) {
    bool isSelected = (group == "gender" && gender == value) || (group == "booking" && bookingType == value);
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (group == "gender") {
              gender = value;
            } else {
              bookingType = value;
            }
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFF1F5382)),
            borderRadius: BorderRadius.circular(10),
            color: isSelected ? Colors.blue[100] : Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Radio(
                value: value,
                groupValue: group == "gender" ? gender : bookingType,
                onChanged: (String? newValue) {
                  setState(() {
                    if (group == "gender") {
                      gender = newValue!;
                    } else {
                      bookingType = newValue!;
                    }
                  });
                },
                activeColor: Color(0xFF1F5382),
              ),
              Text(label, style: TextStyle(color: Color(0xFF1F5382))),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCheckbox(String label, bool value, {bool isSmoking = false}) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (isSmoking) {
              smoke = value;
            } else {
              brushTeeth = value;
            }
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFF1F5382)),
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Row(
            children: [
              Checkbox(
                value: isSmoking ? smoke == value : brushTeeth == value,
                onChanged: (bool? newValue) {
                  setState(() {
                    if (isSmoking) {
                      smoke = newValue!;
                    } else {
                      brushTeeth = newValue!;
                    }
                  });
                },
                activeColor: Color(0xFF1F5382),
                checkColor: Colors.white,
              ),
              Text(label, style: TextStyle(color: Color(0xFF1F5382))),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCounter(String label, int count, Function(int) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(child: Text(label, style: TextStyle(fontSize: 16, color: Color(0xFF1F5382)))),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFF1F5382)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  color: Color(0xFF1F5382),
                  onPressed: () {
                    if (count > 0) {
                      onChanged(count - 1);
                    }
                  },
                ),
                Text(count.toString(), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                IconButton(
                  icon: const Icon(Icons.add),
                  color: Color(0xFF1F5382),
                  onPressed: () {
                    onChanged(count + 1);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUploadField(String hint, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.upload_file, color: Colors.grey),
            const SizedBox(width: 10),
            Text(hint, style: TextStyle(color: Colors.grey, fontSize: 16)),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String text, Color color, VoidCallback onPressed) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: onPressed,
      child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 16)),
    );
  }
}
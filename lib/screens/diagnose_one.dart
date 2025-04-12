import 'package:flutter/material.dart';

class DiagnoseOneScreen extends StatefulWidget {
  const DiagnoseOneScreen({super.key});

  @override
  State<DiagnoseOneScreen> createState() => _DiagnoseOneScreenState();
}

class _DiagnoseOneScreenState extends State<DiagnoseOneScreen> {
  String gender = 'Female';
  String booking = 'VIP';
  String brushTeeth = 'Yes';
  String smoke = 'No';
  String complaint = 'Tooth decay';
  int timesDay = 2;
  List<String> patientDisease = [];

  List<String> complaints = [
    'Tooth decay',
    'Gum disease',
    'Sensitivity',
    'Bad breath',
  ];

  List<String> diseases = [
    'Heart disease',
    'Liver disease',
    'Renal disease',
    'Rheumatic fever',
    'Hypertension',
    'Diabetes',
    'Stroke',
    'Radiotherapy',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.blue.shade900),
        title: Text(
          'Diagnose one',
          style: TextStyle(color: Colors.blue.shade900),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLabel('Name'),
            _buildInput('Nagwa Ahmed Zaki'),
            _buildLabel('Phone'),
            _buildInput('01113829537'),
            _buildLabel('National ID Number'),
            _buildInput('3030329220072'),
            _buildLabel('Age'),
            _buildInput('22'),
            _buildLabel('Adress'),
            _buildInput('Enter Your Adress'),
            _buildLabel('Select your Gender'),
            _buildChoice(['Male', 'Female'], gender, (val) {
              setState(() {
                gender = val;
              });
            }),
            _buildLabel('Choose your complaint'),
            _buildDropdown(complaint, complaints, (val) {
              setState(() {
                complaint = val!;
              });
            }),
            _buildLabel('Select your Booking'),
            _buildChoice(['Normal', 'VIP'], booking, (val) {
              setState(() {
                booking = val;
              });
            }),
            _buildLabel('Do you brush your teeth?'),
            _buildChoice(['Yes', 'No'], brushTeeth, (val) {
              setState(() {
                brushTeeth = val;
              });
            }),
            _buildLabel('How many times a day?'),
            _buildDropdown(timesDay.toString(), ['1', '2', '3'], (val) {
              setState(() {
                timesDay = int.parse(val!);
              });
            }),
            _buildLabel('Do you smoke?'),
            _buildChoice(['Yes', 'No'], smoke, (val) {
              setState(() {
                smoke = val;
              });
            }),
            _buildLabel('How many cigarettes a day?'),
            _buildInput(''),
            const SizedBox(height: 16),
            Text(
              'Patient Disease',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade900,
              ),
            ),
            const SizedBox(height: 8),
            ...diseases.map(
              (disease) => CheckboxListTile(
                value: patientDisease.contains(disease),
                onChanged: (val) {
                  setState(() {
                    if (val == true) {
                      patientDisease.add(disease);
                    } else {
                      patientDisease.remove(disease);
                    }
                  });
                },
                title: Text(disease),
                secondary: Icon(
                  Icons.medical_services_outlined,
                  color: Colors.blue.shade900,
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade900,
                ),
                onPressed: () {},
                child: const Text('Diagnose two'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.blue.shade900,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildInput(String hint) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildChoice(
    List<String> options,
    String selected,
    Function(String) onChange,
  ) {
    return Row(
      children: options
          .map(
            (e) => Expanded(
              child: Container(
                margin: const EdgeInsets.only(right: 8),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor:
                        selected == e ? Colors.blue.shade900 : Colors.white,
                    side: BorderSide(color: Colors.grey.shade400),
                  ),
                  onPressed: () {
                    onChange(e);
                  },
                  child: Text(
                    e,
                    style: TextStyle(
                      color:
                          selected == e ? Colors.white : Colors.blue.shade900,
                    ),
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildDropdown(
    String value,
    List<String> items,
    void Function(String?)? onChanged,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8, top: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButton<String>(
        value: value,
        isExpanded: true,
        underline: Container(),
        items: items
            .map((e) => DropdownMenuItem(value: e, child: Text(e)))
            .toList(),
        onChanged: onChanged,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:smart_lifters/src/db/prefs.dart';

class Gender extends StatefulWidget {
  @override
  State<Gender> createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  String? _selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: Colors.white,

      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: BackButton(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "What's Your Gender?",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GenderButton(
                icon: Icons.male,
                label: 'Male',
                isSelected: _selectedGender == 'Male',
                onTap: () {
                  setState(() {
                    _selectedGender = 'Male';
                  });
                },
              ),
              GenderButton(
                icon: Icons.female,
                label: 'Female',
                isSelected: _selectedGender == 'Female',
                onTap: () {
                  setState(() {
                    _selectedGender = 'Female';
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: _selectedGender != null
                ? () {
                    var user = localData.get('user');
                    user.gender = _selectedGender;
                    localData.put('user', user);
                    Navigator.pushNamed(context, '/onboarding/age');
                  }
                : null, // Disable button if no gender is selected
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              backgroundColor: Colors.black,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            ),
            child: Text("Continue"),
          ),
        ],
      ),
    );
  }
}

class GenderButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const GenderButton({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor:
                isSelected ? Colors.yellow : Colors.grey.shade200,
            child: Icon(
              icon,
              size: 40,
              color: isSelected ? Colors.black : Colors.grey,
            ),
          ),
          SizedBox(height: 10),
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.black : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

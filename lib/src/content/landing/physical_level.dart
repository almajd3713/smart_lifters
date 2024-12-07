import 'package:flutter/material.dart';
import 'package:smart_lifters/src/app/router/router.dart';

class PhysicalLevel extends StatefulWidget {
  @override
  _PhysicalLevelState createState() => _PhysicalLevelState();
}

class _PhysicalLevelState extends State<PhysicalLevel> {
  String? _selectedLevel; // Variable to track the selected option

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Button
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),
              const SizedBox(height: 10),
              // Title
              Text(
                "Physical Activity Level",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              // Description
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 40),
              // Buttons
              Expanded(
                child: Column(
                  children: [
                    _buildButton("Beginner", Colors.yellow, Colors.black),
                    const SizedBox(height: 20),
                    _buildButton("Intermediate", Colors.yellow, Colors.black),
                    const SizedBox(height: 20),
                    _buildButton("Advance", Colors.yellow, Colors.black),
                  ],
                ),
              ),
              // Continue Button
              ElevatedButton(
                onPressed: () {
                  // Use _selectedLevel to pass the selected activity level to the next screen
                  if (_selectedLevel != null) {
                    // Navigate to next screen
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/onboarding/login', // Replace Goal() with the new page you want
                      (route) =>
                          false, // This condition ensures all the previous routes are removed
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 5,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Center(
                    child: Text(
                      "Finish",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(String text, Color backgroundColor, Color textColor) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _selectedLevel = text; // Set the selected level
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: _selectedLevel == text
            ? Colors.grey
            : backgroundColor, // Highlight selected option
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(vertical: 15),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

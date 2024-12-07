// Screen 2: Goal Screen
import 'package:flutter/material.dart';

class Goal extends StatefulWidget {
  @override
  _GoalState createState() => _GoalState();
}

class _GoalState extends State<Goal> {
  String? selectedGoal;

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
                "What Is Your Goal?",
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
              const SizedBox(height: 20),
              // Goal Options
              Expanded(
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    _buildGoalOption("Lose Weight"),
                    SizedBox(height: 10,),
                    _buildGoalOption("Gain Weight"),
                    SizedBox(height: 10,),
                    _buildGoalOption("Muscle Mass Gain"),
                    SizedBox(height: 10,),
                    _buildGoalOption("Shape Body"),
                    SizedBox(height: 10,),
                    _buildGoalOption("Others"),
                    SizedBox(height: 10,),
                  ],
                ),
              ),
              // Continue Button
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/onboarding/physical_level');
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
                      "Continue",
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

  Widget _buildGoalOption(String goal) {
    return RadioListTile<String>(
      value: goal,
      groupValue: selectedGoal,
      onChanged: (value) {
        setState(() {
          selectedGoal = value;
        });
      },
      title: Text(
        goal,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
      activeColor: Colors.yellow,
      tileColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}

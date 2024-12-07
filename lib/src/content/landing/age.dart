import 'package:flutter/material.dart';
import 'package:smart_lifters/src/db/prefs.dart';

class Age extends StatefulWidget {
  @override
  State<Age> createState() => _AgeState();
}

class _AgeState extends State<Age> {
  int _selectedAge = 28; // Initial age value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: Colors.white,

      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "How Old Are You?",
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
          // Text(
          //   '$_selectedAge',
          //   style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
          // ),
          SizedBox(height: 20),
          AgePicker(
            minAge: 18,
            maxAge: 60,
            selectedAge: _selectedAge,
            onChanged: (value) {
              setState(() {
                _selectedAge = value + 18;
              });
            },
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              var user = localData.get('user_signup');
              user.age = _selectedAge;
              localData.put('user_signup', user);
              Navigator.pushNamed(context, '/onboarding/weight');
            },
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

class AgePicker extends StatelessWidget {
  final int minAge;
  final int maxAge;
  final int selectedAge;
  final Function(int) onChanged;

  const AgePicker({
    required this.minAge,
    required this.maxAge,
    required this.selectedAge,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListWheelScrollView.useDelegate(
        itemExtent: 50,
        perspective: 0.003,
        diameterRatio: 2.0,
        physics: FixedExtentScrollPhysics(),
        onSelectedItemChanged: onChanged,
        childDelegate: ListWheelChildBuilderDelegate(
          builder: (context, index) {
            int age = minAge + index;
            return Center(
              child: Text(
                age.toString(),
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: age == selectedAge ? Colors.black : Colors.grey,
                ),
              ),
            );
          },
          childCount: maxAge - minAge + 1,
        ),
      ),
    );
  }
}

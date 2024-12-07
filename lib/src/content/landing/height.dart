import 'package:flutter/material.dart';
import 'package:smart_lifters/src/db/prefs.dart';

class Height extends StatefulWidget {
  @override
  State<Height> createState() => _HeightState();
}

class _HeightState extends State<Height> {
  double _selectedHeight = 140.0; // Default height in cm

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
            "What Is Your Height?",
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
          Text(
            "${_selectedHeight.toInt()} cm",
            style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          HeightPicker(
            minHeight: 140,
            maxHeight: 220,
            selectedHeight: _selectedHeight,
            onChanged: (value) {
              setState(() {
                _selectedHeight = value;
              });
            },
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              var user = localData.get('user');
              user.height = _selectedHeight;
              localData.put('user', user);
              Navigator.pushNamed(context, '/onboarding/goal'); // Adjust route as needed
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              backgroundColor: Colors.black,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              
            ),
            child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Center(
                    child: Text(
                      "Continue",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
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

class HeightPicker extends StatelessWidget {
  final double minHeight;
  final double maxHeight;
  final double selectedHeight;
  final Function(double) onChanged;

  const HeightPicker({
    required this.minHeight,
    required this.maxHeight,
    required this.selectedHeight,
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
        onSelectedItemChanged: (index) {
          onChanged(minHeight + index);
        },
        childDelegate: ListWheelChildBuilderDelegate(
          builder: (context, index) {
            double height = minHeight + index;
            return Center(
              child: Text(
                "${height.toInt()} cm",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: height == selectedHeight ? Colors.black : Colors.grey,
                ),
              ),
            );
          },
          childCount: (maxHeight - minHeight).toInt() + 1,
        ),
      ),
    );
  }
}

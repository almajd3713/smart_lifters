import 'package:flutter/material.dart';
import 'package:smart_lifters/src/db/prefs.dart';

class Weight extends StatefulWidget {
  @override
  State<Weight> createState() => _WeightState();
}

class _WeightState extends State<Weight> {
  double _selectedWeight = 40.0; // Default weight
  bool _isKg = true; // Default unit (KG)

  double toLB() {
    return (_selectedWeight * 2.204).roundToDouble();
  }
  double toKG() {
    return (_selectedWeight / 2.204).roundToDouble();
  }

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
            "What Is Your Weight?",
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
          ToggleButtons(
            isSelected: [_isKg, !_isKg],
            borderRadius: BorderRadius.circular(20),
            selectedColor: Colors.white,
            fillColor: Colors.black,
            onPressed: (index) {
              setState(() {
                _isKg = index == 0;
              });
            },
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text('KG', style: TextStyle(fontSize: 16)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text('LB', style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
          SizedBox(height: 30),
          Text(
            "${_selectedWeight.toInt()} ${_isKg ? 'Kg' : 'Lb'}",
            style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          WeightPicker(
            minWeight: _isKg ? 40 : 88, // KG or LB ranges
            maxWeight: _isKg ? 120 : 265,
            selectedWeight: _selectedWeight,
            onChanged: (value) {
              setState(() {
                _selectedWeight = value;
              });
            },
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              double finalWeight = 
                _isKg ? _selectedWeight
              : toKG();
              var user = localData.get('user_signup');
              user.weight = finalWeight;
              localData.put('user_signup', user);
              Navigator.pushNamed(context, '/onboarding/height'); // Adjust route as needed
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

class WeightPicker extends StatelessWidget {
  final double minWeight;
  final double maxWeight;
  final double selectedWeight;
  final Function(double) onChanged;

  const WeightPicker({
    required this.minWeight,
    required this.maxWeight,
    required this.selectedWeight,
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
          onChanged(minWeight + index);
        },
        childDelegate: ListWheelChildBuilderDelegate(
          builder: (context, index) {
            double weight = minWeight + index;
            return Center(
              child: Text(
                weight.toInt().toString(),
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: weight == selectedWeight ? Colors.black : Colors.grey,
                ),
              ),
            );
          },
          childCount: (maxWeight - minWeight).toInt() + 1,
        ),
      ),
    );
  }
}

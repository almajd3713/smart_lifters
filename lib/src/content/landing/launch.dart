import 'package:flutter/material.dart';
import 'dart:async';

import 'package:smart_lifters/src/db/prefs.dart';

class Launch extends StatefulWidget {
  @override
  _LaunchState createState() => _LaunchState();
}

class _LaunchState extends State<Launch> {
  @override
  void initState() {
    super.initState();
    // Navigate to Onboarding after 2 seconds
    Timer(const Duration(seconds: 3), () {
      checkFirstLaunch();
    });
  }

  void checkFirstLaunch() {
    bool? isFirstLaunch = localData.get('is_first_launch');
    print("AA: $isFirstLaunch");
    if(isFirstLaunch == null || isFirstLaunch) {
      Navigator.pushReplacementNamed(context, '/onboarding');
    } else {
      Navigator.pushReplacementNamed(context, '/onboarding/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.yellow,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.fitness_center,
              size: 100,
              color: Colors.black,
            ),
            SizedBox(height: 20),
            Text(
              'SMART LIFTERS',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

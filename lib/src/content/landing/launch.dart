import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:smart_lifters/src/db/prefs.dart';
import 'package:smart_lifters/src/db/schemas/user/user.dart';

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
    User? current_user = localData.get('user');
    print("AA: $isFirstLaunch");
    print(current_user);
    if(isFirstLaunch == null || isFirstLaunch) {
      Navigator.pushReplacementNamed(context, '/onboarding');
    } else if(current_user!.name != "NULL_USER") {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      Navigator.pushReplacementNamed(context, '/onboarding/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/favicon_black.png', width: 100,),
            const SizedBox(height: 20),
            const Text(
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

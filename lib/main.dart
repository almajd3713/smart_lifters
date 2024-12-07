import 'package:flutter/material.dart';
import 'package:smart_lifters/src/app/app.dart';
import 'package:smart_lifters/src/db/prefs.dart';

void main() async {
  await init_prefs();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const App();
  }
}

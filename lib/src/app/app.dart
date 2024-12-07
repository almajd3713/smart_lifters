

import 'package:flutter/material.dart';
import 'package:smart_lifters/src/app/router/router.dart';
import 'package:smart_lifters/src/app/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      initialRoute: '/launch',
      onGenerateRoute: (settings) => generateRoute(settings),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:smart_lifters/src/content/home_controller.dart';

// Map<String, WidgetBuilder> routes = {
//   '/home'
// };

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(builder: (context) => const ContentController(),);
      default:
        return MaterialPageRoute(builder: (context) => const Center(child: Text("404 Not Found"),),);
    }
  }



import 'package:flutter/material.dart';
import 'package:smart_lifters/src/content/home/home.dart';

class ContentController extends StatefulWidget {
  const ContentController({super.key});

  @override
  State<ContentController> createState() => ContentControllerState();
}

class ContentControllerState extends State<ContentController> {
  int _selectedIndex = 0;
  final List<Widget> _navbarPages = [
    const ScreenHome(),
    const ScreenHome(),
    const ScreenHome(),
    const ScreenHome(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _navbarPages[_selectedIndex],
        bottomNavigationBar: NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          selectedIndex: _selectedIndex,
          onDestinationSelected: (i) => setState(() => _selectedIndex = i),
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home_filled), label: 'Home',),
            NavigationDestination(icon: Icon(Icons.fitness_center), label: 'Workout',),
            NavigationDestination(icon: Icon(Icons.star), label: 'Favorites',),
            NavigationDestination(icon: Icon(Icons.settings), label: 'Settings',)
          ],
        ),
      ),
    );
  }
}
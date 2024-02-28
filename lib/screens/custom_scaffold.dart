import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/bottom_navbar.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;
  final bool showBottomNavBar;
  final int initialIndex;
  const CustomScaffold(
      {super.key,
      required this.body,
      required this.showBottomNavBar,
      this.initialIndex = 0});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      bottomNavigationBar:
          showBottomNavBar ? BottomNavBar(initialIndex: initialIndex) : null,
    );
  }
}

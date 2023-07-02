import 'package:flutter/material.dart';
import 'package:test_fvm/src/screens/old_home.dart';
import 'package:test_fvm/src/screens/profile.dart';

class OldNavigationBar extends StatefulWidget {
  const OldNavigationBar({super.key});

  @override
  State<OldNavigationBar> createState() => _OldNavigationBarState();
}

class _OldNavigationBarState extends State<OldNavigationBar> {
  final screens = [const OldRestaurantHomePage(), const ProfilePage()];
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentPageIndex,
        unselectedItemColor: const Color.fromARGB(255, 156, 171, 182),
        selectedItemColor: const Color(0xFF3282B8),
        elevation: 25.0,
        onTap: (index) {
          setState(() => currentPageIndex = index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

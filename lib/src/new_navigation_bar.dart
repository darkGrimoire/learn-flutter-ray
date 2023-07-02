import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewNavigationBar extends StatefulWidget {
  const NewNavigationBar(
      {super.key, required this.child, required this.location});

  final String location;
  final Widget child;

  @override
  State<NewNavigationBar> createState() => _NewNavigationBarState();
}

class _NewNavigationBarState extends State<NewNavigationBar> {
  // The screens now uses the location path instead of the actual screen implementation.
  final screens = ["/", "/profile"];
  int currentPageIndex = 0;

  // Just to make sure if the current location exactly the same as our current index.
  // If not, just update the index.
  void checkCurrentLocation() {
    if (screens.indexOf(widget.location) != currentPageIndex) {
      setState(() => screens.indexOf(widget.location));
    }
  }

  @override
  Widget build(BuildContext context) {
    checkCurrentLocation();

    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentPageIndex,
        unselectedItemColor: const Color.fromARGB(255, 156, 171, 182),
        selectedItemColor: const Color(0xFF3282B8),
        elevation: 25.0,
        onTap: (index) {
          setState(() => currentPageIndex = index);
          context.go(screens[index]);
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

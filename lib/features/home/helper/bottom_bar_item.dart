import 'package:flutter/material.dart';

class BottomBarItem {
  static const List<BottomNavigationBarItem> item = [
    BottomNavigationBarItem(
      activeIcon: Icon(Icons.home),
      icon: Icon(Icons.home_outlined),
      label: "Home",
    ),
    BottomNavigationBarItem(
      activeIcon: Icon(Icons.favorite),
      icon: Icon(Icons.favorite_outline),
      label: "Favorite",
    ),
    BottomNavigationBarItem(
      activeIcon: Icon(Icons.settings),
      icon: Icon(Icons.settings_outlined),
      label: "Settings",
    ),
    BottomNavigationBarItem(
      activeIcon: Icon(Icons.person),
      icon: Icon(Icons.person_outline),
      label: "Profile",
    ),
  ];
}

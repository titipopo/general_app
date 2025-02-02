import 'package:flutter/material.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar(
      {super.key,
      required this.children,
      required this.currentIndex,
      required this.onTap});
  final List<BottomNavigationBarItem> children;
  final int currentIndex;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: children,
      currentIndex: currentIndex,
      onTap: onTap,
    );
  }
}

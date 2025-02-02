import 'package:flutter/material.dart';
import 'package:general_app/app/shared/ui/app_bottom_navigation.dart';
import 'package:general_app/core/index.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({super.key, required this.child, this.bottomNavigationBar});

  final Widget child;
  final AppBottomNavigationBar? bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    var appTheme = context.appTheme;
    return Scaffold(
        backgroundColor: appTheme.primaryColor,
        bottomNavigationBar: bottomNavigationBar,
        body: child);
  }
}

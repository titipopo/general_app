import 'package:flutter/material.dart';
import 'package:general_app/app/shared/index.dart';
import 'package:go_router/go_router.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return MainView(navigationShell: navigationShell);
  }
}

class MainView extends StatefulWidget {
  const MainView({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  void _onItemTapped(BuildContext context, int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        bottomNavigationBar: AppBottomNavigationBar(
          children: const [
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.home),
            //   label: 'Home',
            // ),
            BottomNavigationBarItem(
              icon: AppIcon(iconData: FontAwesomeIcons.calendarDays),
              label: 'Calendar',
            ),
            BottomNavigationBarItem(
              icon: AppIcon(iconData: FontAwesomeIcons.calculator),
              label: 'Calculator',
            ),
            BottomNavigationBarItem(
              // icon: Icon(Icons.audiotrack),
              icon: AppIcon(iconData: FontAwesomeIcons.music),
              label: 'Musics',
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.chat),
            //   label: 'Chats',
            // ),
            BottomNavigationBarItem(
              icon: AppIcon(iconData: FontAwesomeIcons.list),
              label: 'More',
            ),
          ],
          currentIndex: widget.navigationShell.currentIndex,
          onTap: (int index) => _onItemTapped(context, index),
        ),
        child: SafeArea(
          child: Stack(children: [
            widget.navigationShell,
            //const Bubble(child: Icon(Icons.music_note))
          ]),
        ));
  }
}

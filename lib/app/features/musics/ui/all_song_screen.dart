import 'package:flutter/material.dart';
import 'package:general_app/app/features/musics/ui/songs_list.dart';
import 'package:general_app/core/index.dart';

class AllSongScreen extends StatefulWidget {
  const AllSongScreen({super.key});

  @override
  State<AllSongScreen> createState() => _AllSongScreenState();
}

class _AllSongScreenState extends State<AllSongScreen> {
  bool _loading = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            context.appTheme.colorScheme.background,
            context.appTheme.colorScheme.surface
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: _loading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            )
          : const SongsList(),
    );
  }

  @override
  void initState() {
    super.initState();
    simulate();
  }

  simulate() async {
    await Future.delayed(const Duration(milliseconds: 500));

    setState(() {
      _loading = false;
    });
  }
}

import 'package:flutter/material.dart';
import 'package:general_app/app/features/musics/ui/songs_list.dart';
import 'package:general_app/core/index.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
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
    await Future.delayed(const Duration(milliseconds: 400));

    setState(() {
      _loading = false;
    });
  }
}

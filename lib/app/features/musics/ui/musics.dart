import 'package:flutter/material.dart';
import 'package:general_app/app/features/musics/ui/all_song_screen.dart';
import 'package:general_app/app/features/musics/ui/favourite_screen.dart';
import 'package:general_app/app/features/musics/ui/now_playing_short_screen.dart';
import 'package:general_app/app/features/musics/ui/playlist_screen.dart';
import 'package:general_app/app/shared/index.dart';
import 'package:general_app/core/index.dart';
import 'package:general_app/l10n/l10n.dart';

class MusicsScreen extends StatefulWidget {
  const MusicsScreen({super.key});

  @override
  State<MusicsScreen> createState() => _MusicsScreenState();
}

class _MusicsScreenState extends State<MusicsScreen> {
  int activeTabIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      AppPageHeader(name: AppLocalizations.of(context).musics),
      Expanded(
          child: DefaultTabController(
              length: 3,
              child: Container(
                padding: EdgeInsets.all(AppSizes.s5),
                margin: EdgeInsets.all(AppSizes.s5),
                decoration: BoxDecoration(
                  color: context.appTheme.colorScheme.surface,
                  borderRadius: BorderRadius.all(Radius.circular(AppSizes.s20)),
                ),
                child: Column(children: [
                  TabBar(
                    onTap: (index) {
                      setState(() {
                        activeTabIndex = index;
                      });
                    },
                    tabs: const [
                      Tab(
                        icon: AppIcon(
                          iconData: Icons.audiotrack,
                          size: 25,
                        ),
                        text: 'Songs',
                        iconMargin: EdgeInsets.only(top: 10),
                      ),
                      Tab(
                        icon: AppIcon(
                          iconData: Icons.favorite,
                          size: 25,
                        ),
                        text: 'Favorites',
                        iconMargin: EdgeInsets.only(top: 10),
                      ),
                      Tab(
                        icon: AppIcon(
                          iconData: Icons.queue_music,
                          size: 25,
                        ),
                        text: 'Playlists',
                        iconMargin: EdgeInsets.only(top: 10),
                      ),
                    ],
                  ),
                  const Expanded(
                      child: Stack(
                    children: [
                      TabBarView(
                        children: [
                          AllSongScreen(),
                          FavouriteScreen(),
                          PlaylistScreen(),
                        ],
                      ),
                      Visibility(visible: false, child: NowPlayingShortScreen())
                    ],
                  )),
                ]),
              )))
    ]);
  }
}

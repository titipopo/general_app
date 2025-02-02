
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:general_app/app/features/musics/ui/now_playing_%20full_screen.dart';
import 'package:general_app/app/shared/index.dart';
import 'package:general_app/core/index.dart';

class NowPlayingShortScreen extends StatelessWidget {
  const NowPlayingShortScreen({super.key});

  Future showNowPlayingModelSheet(BuildContext context) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return const NowPlayingFullScreen();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      child: Container(
        height: 70,
        width: context.width,
        decoration: BoxDecoration(
          border: Border.all(color: context.appTheme.colorScheme.outline),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          color: context.appTheme.colorScheme.surface,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: GestureDetector(
            onVerticalDragStart: (drag) {
              showNowPlayingModelSheet(context);
            },
            onTap: () {
              showNowPlayingModelSheet(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        color: context.appTheme.colorScheme.outline,
                      ),
                      width: 45,
                      height: 45,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: AppText(
                              text: 'Song Name', fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                          child: AppText(text: 'Artist Name', size: 15),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const AppIcon(
                        iconData: FontAwesomeIcons.backward,
                        size: 30,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const AppIcon(
                        iconData: FontAwesomeIcons.pause,
                        size: 30,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const AppIcon(
                        iconData: FontAwesomeIcons.forward,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

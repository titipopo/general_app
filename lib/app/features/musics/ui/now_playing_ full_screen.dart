import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:general_app/app/shared/index.dart';
import 'package:general_app/core/index.dart';

class NowPlayingFullScreen extends StatefulWidget {
  const NowPlayingFullScreen({super.key});

  @override
  State<NowPlayingFullScreen> createState() => _NowPlayingFullScreenState();
}

class _NowPlayingFullScreenState extends State<NowPlayingFullScreen> {
  double _percent = 0;
  bool _fav = false;
  bool _repeat = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: context.appTheme.colorScheme.surface,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.pink,
                ),
                width: 400,
                height: 400,
              ),
              const Column(
                children: [
                  AppText(
                    text: 'Song Name',
                    fontWeight: FontWeight.bold,
                  ),
                  AppText(
                    text: 'Artist name goes here',
                    size: 15,
                  ),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _fav = !_fav;
                      });
                    },
                    icon: AppIcon(iconData: 
                      _fav ? Icons.favorite : Icons.favorite_border,
                    ),
                  ),
                  Slider(
                    value: _percent,
                    min: 0,
                    max: 100,
                    onChanged: (newValue) {
                      setState(() {
                        _percent = newValue;
                      });
                    },
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '00:13',
                      ),
                      Text(
                        '00:13',
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      child: RawMaterialButton(
                    onPressed: () {},
                    shape: const CircleBorder(),
                    child: const AppIcon(iconData: 
                      Icons.shuffle,
                    ),
                  )),
                  Expanded(
                      child: RawMaterialButton(
                    onPressed: () {},
                    shape: const CircleBorder(),
                    child: const AppIcon(iconData: 
                      Icons.skip_previous,
                    ),
                  )),
                  Expanded(
                      child: RawMaterialButton(
                    onPressed: () {},
                    fillColor: AppColors.icon,
                    shape: const CircleBorder(),
                    constraints: const BoxConstraints(minHeight: 100),
                    child: const AppIcon(iconData: 
                      Icons.pause,
                      size: 60,
                    ),
                  )),
                  Expanded(
                      child: RawMaterialButton(
                    onPressed: () {},
                    shape: const CircleBorder(),
                    child: const AppIcon(iconData: 
                      Icons.skip_next,
                    ),
                  )),
                  Expanded(
                      child: RawMaterialButton(
                    hoverColor: Colors.amber,
                    onPressed: () {
                      setState(() {
                        _repeat = !_repeat;
                      });
                    },
                    shape: const CircleBorder(),
                    child: AppIcon(iconData: 
                      _repeat ? FontAwesomeIcons.repeat : Icons.repeat_one,
                    ),
                  )),
                ],
              ),
            ],
          ),
        ));
  }
}

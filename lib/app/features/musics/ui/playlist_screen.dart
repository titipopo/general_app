import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:general_app/core/index.dart';

class PlaylistScreen extends StatefulWidget {
  const PlaylistScreen({super.key});

  @override
  State<PlaylistScreen> createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  final TextEditingController _textFieldController = TextEditingController();

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Builder(
            builder: (context) {
              var height = MediaQuery.of(context).size.height;
              var width = MediaQuery.of(context).size.width;

              return SizedBox(
                height: height,
                width: width * 0.98,
                child: TextFormField(
                  controller: _textFieldController,
                  decoration:
                      const InputDecoration(hintText: "Input PlayList Name"),
                ),
              );
            },
          ),
          actions: [
            ElevatedButton(
              child: const Text('CANCEL'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            ElevatedButton(
              child: const Text('OK'),
              onPressed: () {
                log(_textFieldController.text);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
             context.appTheme.colorScheme.background,
            context.appTheme.colorScheme.surface
          ])),
      child: Stack(
        children: [
          ListView(
            children: [
              ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  color: Colors.white,
                ),
                title: const Text(
                  'Playlist Name',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Text(
                  '12 Songs',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                trailing: const Icon(
                  Icons.navigate_next,
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 90,
            right: 20,
            child: FloatingActionButton(
              onPressed: () {
                _displayTextInputDialog(context);
              },
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}

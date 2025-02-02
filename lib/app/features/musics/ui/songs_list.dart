import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:general_app/app/features/musics/models/musics.dart';
import 'package:general_app/app/shared/index.dart';

enum Menu { preview, share, getLink, remove, download }

class SongsList extends StatefulWidget {
  const SongsList({super.key});

  @override
  State<SongsList> createState() => _SongsListState();
}

class _SongsListState extends State<SongsList> {
  List<MusicModel> files = [];
  bool isLoading = false;
  int pageSize = 21;
  String? nextPageToken;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        loginUser("test1@gmail.com", "111111");
      } else {
        print('User is signed in!');
      }
    });

    fetchFiles();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    // Load more items if scrolled to the end of the list
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      fetchFiles();
    }
  }

  Future<void> loginUser(String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('User logged in: ${userCredential.user!.uid}');
    } catch (e) {
      print('Login failed: $e');
    } 
  }

  Future<void> fetchFiles() async {
    if (isLoading) return;

    setState(() {
      isLoading = true;
    });

    Reference ref = FirebaseStorage.instance.ref().child("musics");
    //ListResult result = await ref.listAll();
    List<MusicModel> temps = files;
    String fileName = "";
    try {
      final result = await ref.list(ListOptions(
        maxResults: pageSize,
        pageToken: nextPageToken,
      ));

      for (var ref in result.items) {
        fileName = ref.name;
        int regex = fileName.lastIndexOf('-');
        int fileExt = fileName.lastIndexOf('.');
        String musicName = regex <= 0
            ? fileName
            : fileName
                .substring(0, fileExt)
                .substring(0, regex);
        String author = regex <= 0
            ? ""
            : fileName
                .substring(0, fileExt)
                .substring(regex + 1);

        MusicModel musicModel = MusicModel(
            name: musicName.trim(), author: author.trim(), fullName: fileName);
        temps.add(musicModel);
      }

      setState(() {
        nextPageToken = result.nextPageToken;
        files = temps;
      });
    } catch (e) {
      print('Error listing files: $e');
    }finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: files.length + 1,
      itemBuilder: (context, index) {
        if (index < files.length) {
          return ListTile(
              onTap: () => {log('Tapped')},
              trailing: PopupMenuButton<Menu>(
                popUpAnimationStyle: AnimationStyle.noAnimation,
                icon: const Icon(Icons.more_vert),
                onSelected: (Menu item) {},
                itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
                  const PopupMenuItem<Menu>(
                    value: Menu.preview,
                    child: ListTile(
                      leading: Icon(Icons.visibility_outlined),
                      title: Text('Preview'),
                    ),
                  ),
                  const PopupMenuItem<Menu>(
                    value: Menu.share,
                    child: ListTile(
                      leading: Icon(Icons.share_outlined),
                      title: Text('Share'),
                    ),
                  ),
                  const PopupMenuItem<Menu>(
                    value: Menu.getLink,
                    child: ListTile(
                      leading: Icon(Icons.link_outlined),
                      title: Text('Get link'),
                    ),
                  ),
                  const PopupMenuDivider(),
                  const PopupMenuItem<Menu>(
                    value: Menu.remove,
                    child: ListTile(
                      leading: Icon(Icons.delete_outline),
                      title: Text('Remove'),
                    ),
                  ),
                  const PopupMenuItem<Menu>(
                    value: Menu.download,
                    child: ListTile(
                      leading: Icon(Icons.download_outlined),
                      title: Text('Download'),
                    ),
                  ),
                ],
              ),
              title: AppText(
                text: files[index].name,
                fontWeight: FontWeight.bold,
              ),
              subtitle: AppText(
                text: files[index].author!,
                size: 16,
              ));
        } else {
          return Container(
            padding: const EdgeInsets.all(16.0),
            alignment: Alignment.center,
            child: const CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

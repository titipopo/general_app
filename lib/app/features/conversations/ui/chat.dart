import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:general_app/app/shared/index.dart';
import 'package:general_app/l10n/l10n.dart';
import 'package:go_router/go_router.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<GroupConversationModel> conversations = [];

  @override
  Widget build(BuildContext context) {
    String id = context.read<AuthenticationCubit>().state.user.id;
    return Column(
      children: [
        AppPageHeader(name: AppLocalizations.of(context).chat),
        Padding(
            padding: const EdgeInsets.only(
                left: 10.0, top: 5.0, right: 10.0, bottom: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: SearchAnchor(builder: (context, controller) {
                  return SearchBar(
                    controller: controller,
                    padding: const MaterialStatePropertyAll<EdgeInsets>(
                        EdgeInsets.symmetric(horizontal: 16.0)),
                    onTap: () {},
                    onChanged: (_) {},
                    leading: const Icon(Icons.search),
                  );
                }, suggestionsBuilder: (context, controller) {
                  return List<ListTile>.generate(5, (int index) {
                    final String item = 'item $index';
                    return ListTile(
                      title: Text(item),
                      onTap: () {
                        setState(() {
                          controller.closeView(item);
                        });
                      },
                    );
                  });
                })),
                IconButton(
                    onPressed: () =>
                        context.goNamed(AppRouters.createConversation),
                    icon: const Icon(Icons.add))
              ],
            )),
        Expanded(
            child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("group")
              .where('members', arrayContains: id)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            conversations.clear();
            for (var e in snapshot.data!.docs) {
              Map<String, dynamic> data = e.data() as Map<String, dynamic>;
              var model = GroupConversationModel.fromMap(data);

              conversations.add(model);
            }

// final conversations1 = snapshot.data!.docs.map((e) => GroupModel.fromJson(e.data() as Map<String, dynamic>)).toList();

            return ListView.builder(
              itemCount: conversations.length,
              itemBuilder: (context, index) {
                return Card(
                    child: ListTile(
                  onTap: () => {
                    //context.go("${AppRouters.chats}/${AppRouters.chatDetails}?groupId=${snapshot.data!.docs[index].id}&groupType=${snapshot.data!.docs[index]["type"]}")
                    context.goNamed(AppRouters.chatDetails, queryParameters: {
                      'groupId': snapshot.data!.docs[index].id,
                      // 'groupType': conversations[index].type.toString(),
                      'groupName': conversations[index].groupName,
                    })
                  },
                  title: Text(conversations[index].groupName!),
                  subtitle:
                      Text(conversations[index].lastMessage!.message),
                ));
              },
            );
          },
        ))
      ],
    );
  }
}

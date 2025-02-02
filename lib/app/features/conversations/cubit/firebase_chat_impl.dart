import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseChat implements IChat {
  FirebaseChat({
    required FirebaseFirestore firebaseFirestore,
    required FirebaseStorage firebaseStorage,
  })  : _firebaseFirestore = firebaseFirestore,
        _firebaseStorage = firebaseStorage;

  final FirebaseFirestore _firebaseFirestore;
  final FirebaseStorage _firebaseStorage;

  @override
  Future<ConversationModel> startConversation({
    required String recipientMIdOrEmail,
    required UserModel currentUser,
  }) async {
    try {
      late final QuerySnapshot<Map<String, dynamic>> userDocument;

      // throw exception if user is trying to start conversation with
      // themself
      if (currentUser.mID == recipientMIdOrEmail ||
          currentUser.email == recipientMIdOrEmail) {
        throw Exception('You cannot chat with yourself.');
      }

      // user is trying to start conversation with a user with their email
      if (recipientMIdOrEmail.isEmail) {
        userDocument = await _firebaseFirestore
            .collection('users')
            .where(
              'email',
              isEqualTo: recipientMIdOrEmail,
            )
            .get();
      }
      // user is trying to start conversation with a user with their mID
      else {
        userDocument = await _firebaseFirestore
            .collection('users')
            .where(
              'mID',
              isEqualTo: recipientMIdOrEmail,
            )
            .get();
      }

      // start conversation if recipient data is found
      if (userDocument.docs.isNotEmpty) {
        final recipient = userDocument.docs.first.data();

        final conversationDocument =
            _firebaseFirestore.collection('conversations').doc();

        final docId = conversationDocument.id;

        final recipientUser = UserModel.fromMap(recipient);

        final conversation = ConversationModel(
          participants: [recipientUser, currentUser],
          createdBy: currentUser.id,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          documentId: docId,
          participantsIds: [recipientUser.id, currentUser.id],
        );

        await conversationDocument.set(conversation.toMap());
        return conversation;
      } else {
        throw Exception('User not found!');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> sendMessage({
    required MessageModel message,
    required String id,
  }) async {
    try {
      // generate unique docId for the shared conversation
      final docId = id;

      // recipient and sender conversation document
      final conversationDocument =
          _firebaseFirestore.collection('conversations').doc(docId);

      // recipient and sender messages collection
      final messageCollection = conversationDocument.collection('messages');

      final messageAsMap = message.toMap()
        ..addAll({
          'timestamp': Timestamp.now().millisecondsSinceEpoch,
          'status': MessageType.pending.name,
        });

      // add new message
      final messageRef = await messageCollection.add(
        messageAsMap,
      );

      // update message now with status [sent]
      await messageRef.update(
        messageAsMap
          ..addAll({
            'status': MessageType.sent.name,
          }),
      );

      // update conversation lastUpdatedAt and lastMessage fields
      await conversationDocument.update({
        'lastUpdatedAt': Timestamp.now().millisecondsSinceEpoch,
        'lastMessage': messageAsMap,
      });
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> sendVoiceMessage({
    required MessageModel message,
    required String filePath,
    required String id,
  }) async {
    try {
      // generate unique docId for the shared conversation
      final docId = id;

      // recipient and sender conversation document
      final conversationDocument =
          _firebaseFirestore.collection('conversations').doc(docId);

      // recipient and sender messages collection
      final messageCollection = conversationDocument.collection('messages');

      // add timestamp and status of message
      final messageAsMap = message.toMap()
        ..addAll({
          'timestamp': Timestamp.now().millisecondsSinceEpoch,
          'status': MessageType.pending.name,
        });

      // add new message
      final messageRef = await messageCollection.add(messageAsMap);

      // ref to new audio message
      final audioMessageRef = _firebaseStorage
          .ref()
          .child('voice-messages/${DateTime.now().millisecondsSinceEpoch}.m4a');

      // upload new audio message
      await audioMessageRef.putFile(File(filePath));

      // get url of audio
      final url = await audioMessageRef.getDownloadURL();

      // update message now with url path and status [sent]
      await messageRef.update(
        messageAsMap
          ..addAll({
            'url': url,
            'status': MessageType.sent.name,
          }),
      );

      // update conversation lastUpdatedAt and lastMessage fields
      await conversationDocument.update({
        'lastUpdatedAt': Timestamp.now().millisecondsSinceEpoch,
        'lastMessage': messageAsMap,
      });

      // clear audio file no longer needed
      _clearTempFile(filePath);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> sendGroupMessage({
    required GroupMessageModel message,
    required String id,
  }) async {
    try {
      // unique docId for the group conversation
      final docId = id;

      // recipient and sender conversation document
      final conversationDocument =
          _firebaseFirestore.collection('group-conversations').doc(docId);

      // recipient and sender messages collection
      final messageCollection = conversationDocument.collection('messages');

      final messageAsMap = message.toMap()
        ..addAll({
          'timestamp': Timestamp.now().millisecondsSinceEpoch,
          'status': MessageType.pending.name,
        });

      // add new message
      final messageRef = await messageCollection.add(
        messageAsMap,
      );

      // update message now with status [sent]
      await messageRef.update(
        messageAsMap
          ..addAll({
            'status':MessageType.sent.name,
          }),
      );

      // update conversation lastUpdatedAt and lastMessage fields
      await conversationDocument.update({
        'lastUpdatedAt': Timestamp.now().millisecondsSinceEpoch,
        'lastMessage': messageAsMap,
      });
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> sendGroupVoiceMessage({
    required GroupMessageModel message,
    required String filePath,
    required String id,
  }) async {
    try {
      //  unique docId for the group conversation
      final docId = id;

      // group conversation document
      final conversationDocument =
          _firebaseFirestore.collection('group-conversations').doc(docId);

      // recipient and sender messages collection
      final messageCollection = conversationDocument.collection('messages');

      // add timestamp and status of message
      final messageAsMap = message.toMap()
        ..addAll({
          'timestamp': Timestamp.now().millisecondsSinceEpoch,
          'status': MessageType.pending.name,
        });

      // add new message
      final messageRef = await messageCollection.add(messageAsMap);

      // ref to new audio message
      final audioMessageRef = _firebaseStorage
          .ref()
          .child('voice-messages/${DateTime.now().millisecondsSinceEpoch}.m4a');

      // upload new audio message
      await audioMessageRef.putFile(File(filePath));

      // get url of audio
      final url = await audioMessageRef.getDownloadURL();

      // update message now with url path and status [sent]
      await messageRef.update(
        messageAsMap
          ..addAll({
            'url': url,
            'status': MessageType.sent.name,
          }),
      );

      // update conversation lastUpdatedAt and lastMessage fields
      await conversationDocument.update({
        'lastUpdatedAt': Timestamp.now().millisecondsSinceEpoch,
        'lastMessage': messageAsMap,
      });

      // clear audio file no longer needed
      _clearTempFile(filePath);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Stream<List<MessageModel>> messageStream({
    required String id,
  }) =>
      _firebaseFirestore
          .collection('conversations')
          .doc(id)
          .collection('messages')
          .orderBy('timestamp')
          .snapshots()
          .map(
            (snapshot) => snapshot.docs
                .map((doc) => MessageModel.fromMap(doc.data()))
                .toList(),
          );

  @override
  Stream<List<GroupMessageModel>> groupMessageStream({
    required String id,
  }) =>
      _firebaseFirestore
          .collection('group-conversations')
          .doc(id)
          .collection('messages')
          .orderBy('timestamp')
          .snapshots()
          .map(
            (snapshot) => snapshot.docs
                .map((doc) => GroupMessageModel.fromMap(doc.data()))
                .toList(),
          );

  @override
  Stream<List<ConversationModel>> conversationStream({required String userId}) =>
      _firebaseFirestore
          .collection('conversations')
          .where(
            'participantsIds',
            arrayContains: userId,
          )
          .orderBy('lastUpdatedAt', descending: true)
          .snapshots()
          .map(
            (querySnapshot) => querySnapshot.docs
                .map((doc) => ConversationModel.fromMap(doc.data()))
                .toList(),
          );

  @override
  Stream<List<GroupConversationModel>> groupConversationStream({
    required String userId,
  }) =>
      _firebaseFirestore
          .collection('group-conversations')
          .where(
            'participantsIds',
            arrayContains: userId,
          )
          .orderBy('lastUpdatedAt', descending: true)
          .snapshots()
          .map(
            (querySnapshot) => querySnapshot.docs
                .map((doc) => GroupConversationModel.fromMap(doc.data()))
                .toList(),
          );

  @override
  Future<List<UserModel>> getConversers({required String userId}) async {
    try {
      // get all conversations where current user is part of
      final conversationsRef = await _firebaseFirestore
          .collection('conversations')
          .where(
            'participantsIds',
            arrayContains: userId,
          )
          .get();

      final conversationDocs = conversationsRef.docs;

      // all of this user conversations
      final conversations = conversationDocs
          .map(
            (conversationSnapshot) =>
                ConversationModel.fromMap(conversationSnapshot.data()),
          )
          .toList();

      // users who partook in the conversations i.e conversers
      final users = conversations
          .map(
            (conversation) => conversation.participants
                .extrapolateParticipantByCurrentUserId(userId),
          )
          .toList();

      return users;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<GroupConversationModel> startAGroupConversation({
    required GroupConversationModel conversation,
  }) async {
    try {
      // create a conversation document
      final groupConversationDoc =
          _firebaseFirestore.collection('group-conversations').doc();

      final conversationMap = conversation.toMap()
        ..addAll({'documentId': groupConversationDoc.id});

      // add a conversation
      await groupConversationDoc.set(
        conversationMap,
      );

      // print(conversationMap.toString());
      return GroupConversationModel.fromMap(conversationMap);
    } catch (e) {
      throw Exception(e);
    }
  }
}

/// simple helper function to delete file
void _clearTempFile(String filePath) {
  final file = File(filePath);
  if (file.existsSync()) {
    unawaited(file.delete());
  }
}

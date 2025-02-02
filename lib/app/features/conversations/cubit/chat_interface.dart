

abstract class IChat {
  /// Start chat with this [recipientMIdOrEmail]
  Future<ConversationModel> startConversation({
    required String recipientMIdOrEmail,
    required UserModel currentUser,
  });

  /// Send a text message
  Future<void> sendMessage({required MessageModel message, required String id});

  /// Send a group text message
  Future<void> sendGroupMessage({
    required GroupMessageModel message,
    required String id,
  });

  /// Send a group voice message
  Future<void> sendGroupVoiceMessage({
    required GroupMessageModel message,
    required String filePath,
    required String id,
  });

  /// Send a voice message
  Future<void> sendVoiceMessage({
    required MessageModel message,
    required String filePath,
    required String id,
  });

  /// A Stream of messages for a particular [Conversation]
  Stream<List<MessageModel>> messageStream({
    required String id,
  });

  /// A Stream of messages for a particular [Conversation]
  Stream<List<GroupMessageModel>> groupMessageStream({
    required String id,
  });

  /// A Stream of this user [Conversation]s
  Stream<List<ConversationModel>> conversationStream({required String userId});

  /// A Stream of this user [GroupConversation]s
  Stream<List<GroupConversationModel>> groupConversationStream({
    required String userId,
  });

  /// Get the list of all users that the current [MinChatUser] converses with
  Future<List<UserModel>> getConversers({required String userId});

  /// Start a group conversation
  Future<GroupConversationModel> startAGroupConversation({
    required GroupConversationModel conversation,
  });
}

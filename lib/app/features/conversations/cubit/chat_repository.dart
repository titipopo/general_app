



class ChatRepository {
  ChatRepository({
    required IChat chatInterface,
    required UserDataAccessObject userDao,
  })  : _chatInterface = chatInterface,
        _userDao = userDao;

  final IChat _chatInterface;
  final UserDataAccessObject _userDao;

  Future<Result<ConversationModel>> startConversation({
    required String recipientMIdOrEmail,
    
  }) async {
    try {
      final response = await _chatInterface.startConversation(
        recipientMIdOrEmail: recipientMIdOrEmail,
        currentUser: _userDao.readUser(),
      );
      return Result.success(response);
    } catch (e) {
      return Result.failure(errorMessage: e.toString());
    }
  }

  Future<Result<void>> sendMessage({
    required MessageModel message,
    required String id,
  }) async {
    try {
      final response = await _chatInterface.sendMessage(
        message: message,
        id: id,
      );
      return Result.success(response);
    } catch (e) {
      return Result.failure(errorMessage: e.toString());
    }
  }

  Future<Result<void>> sendGroupMessage({
    required GroupMessageModel message,
    required String id,
  }) async {
    try {
      final response = await _chatInterface.sendGroupMessage(
        message: message,
        id: id,
      );
      return Result.success(response);
    } catch (e) {
      return Result.failure(errorMessage: e.toString());
    }
  }

  Future<Result<void>> sendVoiceMessage({
    required MessageModel message,
    required String filePath,
    required String id,
  }) async {
    try {
      final response = await _chatInterface.sendVoiceMessage(
        message: message,
        filePath: filePath,
        id: id,
      );
      return Result.success(response);
    } catch (e) {
      return Result.failure(errorMessage: e.toString());
    }
  }

  Future<Result<void>> sendGroupVoiceMessage({
    required GroupMessageModel message,
    required String filePath,
    required String id,
  }) async {
    try {
      final response = await _chatInterface.sendGroupVoiceMessage(
        message: message,
        filePath: filePath,
        id: id,
      );
      return Result.success(response);
    } catch (e) {
      return Result.failure(errorMessage: e.toString());
    }
  }

  Stream<List<MessageModel>> messageStream({
    required String id,
  }) =>
      _chatInterface.messageStream(
        id: id,
      );

  Stream<List<GroupMessageModel>> groupMessageStream({
    required String id,
  }) =>
      _chatInterface.groupMessageStream(
        id: id,
      );

  Stream<List<ConversationModel>> conversationStream({required String userId}) =>
      _chatInterface.conversationStream(userId: userId);

  Stream<List<GroupConversationModel>> groupConversationStream({
    required String userId,
  }) =>
      _chatInterface.groupConversationStream(userId: userId);

  Future<Result<List<UserModel>>> getConversers({
    required String userId,
  }) async {
    try {
      final response = await _chatInterface.getConversers(userId: userId);
      return Result.success(response);
    } catch (e) {
      return Result.failure(errorMessage: e.toString());
    }
  }

  Future<Result<GroupConversationModel>> startAGroupConversation({
    required GroupConversationModel conversation,
  }) async {
    try {
      final response = await _chatInterface.startAGroupConversation(
        conversation: conversation,
      );
      return Result.success(response);
    } catch (e) {
      return Result.failure(errorMessage: e.toString());
    }
  }
}

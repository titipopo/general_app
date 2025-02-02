
import 'package:general_app/app/features/conversations/models/base_message_model.dart';
import 'package:general_app/app/features/conversations/models/conversation_model.dart';
import 'package:general_app/app/features/conversations/models/group_conversation.dart';
import 'package:general_app/app/features/conversations/models/user_model.dart';

/// classes that
abstract class BaseConversationModel {
  BaseConversationModel({
    required this.participants,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
    this.participantsIds,
    this.lastMessage,
    this.documentId,
  });

  final List<ChatUserModel> participants;
  final String createdBy;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<String>? participantsIds;
  final BaseMessageModel? lastMessage;
  final String? documentId;

  factory BaseConversationModel.fromMap(Map<String, dynamic> map) {
    if (map['groupName'] != null) {
      return GroupConversationModel.fromMap(map);
    }
    return ConversationModel.fromMap(map);
  }

  // Abstract method to be implemented by subclasses
  Map<String, dynamic> toMap();

  // Method to be overridden by subclasses to include extra information
  Map<String, dynamic> additionalInfo() {
    return {};
  }
}

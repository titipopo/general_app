import 'package:equatable/equatable.dart';
import 'package:general_app/app/features/conversations/models/group_message_model.dart';
import 'package:general_app/app/features/conversations/models/user_model.dart';

class GroupConversationModel extends BaseConversationModel with EquatableMixin {
  GroupConversationModel({
    required super.createdBy,
    required super.createdAt,
    required super.updatedAt,
    required super.participantsIds,
    required this.groupName,
    super.participants = const <ChatUserModel>[],
    super.documentId,
    super.lastMessage,
  });

  factory GroupConversationModel.fromMap(Map<String, dynamic> data) {
    final message = data['lastMessage'] != null
        ? GroupMessageModel.fromMap(data['lastMessage'] as Map<String, dynamic>)
        : null;

    return GroupConversationModel(
      createdBy: data['initiatedBy'] as String,
      createdAt:
          DateTime.fromMillisecondsSinceEpoch(data['initiatedAt'] as int),
      updatedAt:
          DateTime.fromMillisecondsSinceEpoch(data['lastUpdatedAt'] as int),
      participantsIds:
          List<String>.from(data['participantsIds'] as List<dynamic>),
      groupName: data['groupName'] as String,
      documentId: data['documentId'] as String,
      lastMessage: message,
    );
  }

  final String groupName;

  @override
  Map<String, dynamic> toMap() {
    final baseMap = {
      'createdBy': createdBy,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
      'participantsIds': participantsIds,
      'groupName': groupName,
      'documentId': documentId,
      'lastMessage': lastMessage?.toMap(),
    };
    return baseMap;
  }

  @override
  List<Object?> get props => [
        participantsIds,
        createdBy,
        createdAt,
        updatedAt,
        lastMessage,
        groupName,
        documentId,
      ];
}

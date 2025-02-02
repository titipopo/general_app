
import 'package:equatable/equatable.dart';
import 'package:general_app/app/features/conversations/models/message_model.dart';
import 'package:general_app/app/features/conversations/models/user_model.dart';

class ConversationModel extends BaseConversationModel with EquatableMixin {
  ConversationModel({
    required super.createdBy,
    required super.createdAt,
    required super.updatedAt,
    required super.participants,
    super.participantsIds,
    super.lastMessage,
    super.documentId,
  });

  factory ConversationModel.fromMap(Map<String, dynamic> data) {
    final participantsData = data['participants'] as List<dynamic>;

    final participants = participantsData
        .map((e) => ChatUserModel.fromMap(e as Map<String, dynamic>))
        .toList();

    final message = data['lastMessage'] != null
        ? MessageModel.fromMap(data['lastMessage'] as Map<String, dynamic>)
        : null;

    return ConversationModel(
      createdBy: data['createdBy'] as String,
      createdAt: DateTime.fromMillisecondsSinceEpoch(data['createdAt'] as int),
      participants: participants,
      updatedAt: DateTime.fromMillisecondsSinceEpoch(data['updatedAt'] as int),
      lastMessage: message,
      documentId: data['documentId'] as String?,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    final baseMap = {
      'createdBy': createdBy,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
      'participants': participants.map((user) => user.toMap()).toList(),
      'participantsIds': participantsIds,
      'documentId': documentId,
      'lastMessage': lastMessage?.toMap(),
    };
    return {...baseMap, ...additionalInfo()};
  }

  @override
  List<Object?> get props =>
      [participants, createdAt, createdBy, updatedAt, lastMessage];
}

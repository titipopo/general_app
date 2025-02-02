

import 'package:general_app/app/features/conversations/models/base_message_model.dart';
import 'package:general_app/app/features/conversations/models/user_model.dart';

class GroupMessageModel extends BaseMessageModel {
  GroupMessageModel({
    required super.senderId,
    required super.recipientId,
    required super.message,
    required this.senderInfo,
    super.status,
    super.messageType,
    super.timestamp,
    super.url,
  });

  factory GroupMessageModel.fromMap(Map<String, dynamic> doc) {
    return GroupMessageModel(
      senderId: doc['senderId'] as String,
      recipientId: doc['recipientId'] as String,
      message: doc['message'] as String,
      timestamp: DateTime.fromMillisecondsSinceEpoch(doc['timestamp'] as int),
      senderInfo:
          ChatUserModel.fromMap(doc['senderInfo'] as Map<String, dynamic>),
      status: doc['status'] as String?,
      messageType: doc['messageType'] as String?,
      url: doc['url'] as String?,
    );
  }
  final ChatUserModel senderInfo;

  @override
  Map<String, dynamic> toMap() {
    final baseMap = {
      'senderId': senderId,
      'recipientId': recipientId,
      'message': message,
      'timestamp': timestamp?.millisecondsSinceEpoch,
      'messageType': messageType,
      'status': status,
      'url': url,
    };

    return {...baseMap, ...additionalInfo()};
  }

  @override
  Map<String, dynamic> additionalInfo() {
    return {'senderInfo': senderInfo.toMap()};
  }
}

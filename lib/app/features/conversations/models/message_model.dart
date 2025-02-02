

import 'package:general_app/app/features/conversations/models/base_message_model.dart';

class MessageModel extends BaseMessageModel {
  MessageModel({
    required super.senderId,
    required super.recipientId,
    required super.message,
    super.status,
    super.messageType,
    super.timestamp,
    super.url,
  });

  factory MessageModel.fromMap(Map<String, dynamic> doc) {
    return MessageModel(
      senderId: doc['senderId'] as String,
      recipientId: doc['recipientId'] as String,
      message: doc['message'] as String,
      timestamp: doc['timestamp'] != null
          ? DateTime.fromMillisecondsSinceEpoch(doc['timestamp'] as int)
          : null,
      status: doc['status'] as String?,
      messageType: doc['messageType'] as String?,
      url: doc['url'] as String?,
    );
  }

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
}

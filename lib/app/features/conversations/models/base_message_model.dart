

import 'package:general_app/app/features/conversations/models/group_message_model.dart';
import 'package:general_app/app/features/conversations/models/message_model.dart';

abstract class BaseMessageModel {
  BaseMessageModel({
    required this.senderId,
    required this.recipientId,
    required this.message,
    this.status,
    this.messageType,
    this.timestamp,
    this.url,
  });

  final String senderId;
  final String recipientId;
  final String message;
  final String? status;
  final String? messageType;
  final DateTime? timestamp;
  final String? url;

  factory BaseMessageModel.fromMap(Map<String, dynamic> doc) {
    if (doc['senderInfo'] != null) {
      return GroupMessageModel.fromMap(doc);
    }

    return MessageModel.fromMap(doc);
  }

  // Abstract method to be implemented by subclasses
  Map<String, dynamic> toMap();

  // Method to be overridden by subclasses to include extra information
  Map<String, dynamic> additionalInfo() {
    return {};
  }

  @override
  String toString() {
    return toMap().toString();
  }
}

enum MessageType {
  text,
  audio,
  image,
  sent,
  others,
  pending;
}

extension MessageX on BaseMessageModel {
  bool isMessageFromCurrentUser(String currentUserId) =>
      senderId == currentUserId;
}

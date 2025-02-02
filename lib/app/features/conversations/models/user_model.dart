import 'package:equatable/equatable.dart';

class ChatUserModel with EquatableMixin {
  final String? name;

  final String? email;

  final String? imageUrl;

  final String? mID;

  final String id;

  const ChatUserModel({
    required this.id,
    this.name,
    this.email,
    this.mID,
    this.imageUrl,
  });

  factory ChatUserModel.fromMap(Map<String, dynamic>? map) => ChatUserModel(
        id: map?['id'] as String,
        name: map?['name'] as String,
        email: map?['email'] as String,
        mID: map?['mID'] as String,
        imageUrl: map?['imageUrl'] as String,
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'mID': mID,
      'imageUrl': imageUrl,
    };
  }

  @override
  List<Object?> get props => [id, name, email, mID, imageUrl];
}

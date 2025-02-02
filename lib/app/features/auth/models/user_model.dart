import 'package:equatable/equatable.dart';

class UserModel with EquatableMixin {
  final String? name;

  final String? email;

  final String? imageUrl;

  final String? mID;

  final String id;

  const UserModel({
    required this.id,
    this.name,
    this.email,
    this.mID,
    this.imageUrl,
  });

  factory UserModel.fromMap(Map<String, dynamic>? map) => UserModel(
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

  /// Empty user which represents an unauthenticated user.
  static const empty = UserModel(id: '');

  /// Convenience getter to determine whether the current user is empty.
  bool get isEmpty => this == UserModel.empty;

  /// Convenience getter to determine whether the current user is not empty.
  bool get isNotEmpty => this != UserModel.empty;

  @override
  List<Object?> get props => [id, name, email, mID, imageUrl];
}

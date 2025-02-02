import 'dart:async';

import 'package:general_app/app/features/auth/models/user_model.dart';
import 'package:general_app/app/features/auth/services/authentication_interface.dart';
import 'package:general_app/core/index.dart';

class AuthenticationRepository {
  AuthenticationRepository({
    required IAuthentication authenticationInterface,
  })  : _authenticationInterface = authenticationInterface {
    _initializeBroadcast();
  }

  final IAuthentication _authenticationInterface;

  late StreamController<UserModel?> _userController;
  Stream<UserModel?> get userSubscription => _userController.stream;

  void _initializeBroadcast() {
    _userController = StreamController<UserModel?>.broadcast();
  }

  UserModel get user {
    if (_authenticationInterface.authenticatedUser.isNotEmpty) {
    }
    return UserModel.empty;
  }

  Future<Result<void>> registerWithEmail(String email, String password) async {
    try {
      final response =
          await _authenticationInterface.registerWithEmail(email, password);
      final user = _authenticationInterface.authenticatedUser;
      if (user.isNotEmpty) {
        _userController.add(user);
      } else {
        return Result.failure(errorMessage: 'Google sign in failed.');
      }
      return Result.success(response);
    } catch (e) {
      return Result.failure(errorMessage: e.toString());
    }
  }

  Future<Result<void>> signInWithEmail(String email, String password) async {
    try {
      final response =
          await _authenticationInterface.signInEmail(email, password);
      final user = _authenticationInterface.authenticatedUser;
      if (user.isNotEmpty) {
        _userController.add(user);
      } else {
        return Result.failure(errorMessage: 'Email sign in failed.');
      }
      return Result.success(response);
    } catch (e) {
      return Result.failure(errorMessage: e.toString());
    }
  }

  Future<Result<void>> signInWithGithub() async {
    try {
      final response = await _authenticationInterface.signInGithub();
      final user = _authenticationInterface.authenticatedUser;

      if (user.isNotEmpty) {
        _userController.add(user);
      } else {
        return Result.failure(errorMessage: 'Github sign in failed.');
      }
      return Result.success(response);
    } catch (e) {
      return Result.failure(errorMessage: e.toString());
    }
  }

  Future<Result<void>> signInWithGoogle() async {
    try {
      final response = await _authenticationInterface.signInWithGoogle();
      final user = _authenticationInterface.authenticatedUser;

      if (user.isNotEmpty) {
        _userController.add(user);
      } else {
        return Result.failure(errorMessage: 'Google sign in failed.');
      }

      return Result.success(response);
    } catch (e) {
      return Result.failure(errorMessage: e.toString());
    }
  }

  Future<Result<void>> signOut() async {
    try {
      final response = await _authenticationInterface.signOut();
      _userController.add(null);
      return Result.success(response);
    } catch (e) {
      return Result.failure(errorMessage: e.toString());
    }
  }

  void dispose() {
    _userController.close();
  }
}

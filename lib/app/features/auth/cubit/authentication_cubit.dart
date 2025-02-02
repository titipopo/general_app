
import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:general_app/app/features/auth/models/user_model.dart';

part 'authentication_state.dart';

enum AuthenticationStatus {
  authenticated,
  unauthenticated;
}

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit(
  )  :
        super(const AuthenticationState.unauthenticated()) {
    _initUserSubscription();
  }

final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  late final StreamSubscription<UserModel?> _userSubscription;

  Future<void> _checkInitialAuthStatus() async {
    final userId = _prefs.getString('userId');
    if (userId != null) {
      final user = _firebaseAuth.currentUser;
      if (user != null && user.uid == userId) {
        emit(AuthAuthenticated(user: user));
      } else {
        emit(AuthUnauthenticated());
      }
    } else {
      emit(AuthUnauthenticated());
    }
  }

  void _initUserSubscription() {
    _userSubscription =
        _authenticationRepository.userSubscription.listen(_onUserChanged);
  }

  void _onUserChanged(UserModel? user) {
    if (user == null || user.isEmpty) {
      emit(const AuthenticationState.unauthenticated());
    } else {
      emit(AuthenticationState.authenticated(_authenticationRepository.user));
    }
  }

  void signOut() => unawaited(_authenticationRepository.signOut());

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}

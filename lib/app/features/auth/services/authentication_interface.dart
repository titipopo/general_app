
import 'package:general_app/app/features/auth/models/user_model.dart';

abstract class IAuthentication {
  UserModel get authenticatedUser;
  Future<void> registerWithEmail(String email, String password);
  Future<void> signInEmail(String email, String password);
  Future<void> signInGithub();
  Future<void> signInWithGoogle();
  Future<void> signOut();
}

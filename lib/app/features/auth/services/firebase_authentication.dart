import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:general_app/app/features/auth/models/user_model.dart';
import 'package:general_app/app/features/auth/services/authentication_interface.dart';
import 'package:general_app/core/index.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthentication implements IAuthentication {
  FirebaseAuthentication(this._firebaseFirestore)  : super (){
    _initAuthStateListener();
  }

  final FirebaseAuth _firebaseAuth =;
  final FirebaseFirestore _firebaseFirestore;

  User? _user;

  UserModel _authenticatedUser = UserModel.empty;

  void _initAuthStateListener() {
    _firebaseAuth.authStateChanges().listen((user) {
      _user = user;

      if (_user != null) {
        _authenticatedUser = UserModel(id: _user!.uid);
      }
    });
  }

  @override
  UserModel get authenticatedUser {
    if (_authenticatedUser.isEmpty || _user == null) {
      return UserModel.empty;
    }
    return _authenticatedUser;
  }

  @override
  Future<void> registerWithEmail(
    String email,
    String password,
  ) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      final User? firebaseUser = userCredential.user;
      if (firebaseUser != null) {
        addNewUser();
      }
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> signInEmail(
    String email,
    String password,
  ) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final User? firebaseUser = userCredential.user;
      if (firebaseUser != null) {
        addNewUser();
      }
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> signInGithub() async {
    try {
      final githubProvider = GithubAuthProvider();
      await _firebaseAuth.signInWithProvider(githubProvider);
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> signInWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn().signIn();

      final googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final userCredential =
          await _firebaseAuth.signInWithCredential(credential);

      if (userCredential.additionalUserInfo!.isNewUser) {
        addNewUser();
      } else {
        final snapshot =
            await _firebaseFirestore.collection('users').doc(_user?.uid).get();
        final userMap = snapshot.data();
        _authenticatedUser = UserModel.fromMap(userMap!);
      }
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> signOut() => _firebaseAuth.signOut();

  Future<void> addNewUser() async {
    String mID = generateMID;

    bool result = false;

    while (!result) {
      mID = generateMID;
      result = checkMId(mID) as bool;
    }

    if (result) {
      _authenticatedUser = UserModel(
        id: _user?.uid ?? '',
        name: _user?.displayName,
        email: _user?.email,
        mID: mID,
        imageUrl: _user?.photoURL,
      );
      // create firestore user
      await _firebaseFirestore
          .collection('users')
          .doc(_user?.uid)
          .set(_authenticatedUser.toMap());
    }
  }

  Future<bool> checkMId(String mID) async {
    // check mID
    final snapshot = await _firebaseFirestore
        .collection('users')
        .where(mID, isEqualTo: mID)
        .limit(1)
        .get();

    return snapshot.docs.isEmpty;
  }

  String get generateMID => '${generatePrefixForID()}${generateSuffixForID(2)}';
}

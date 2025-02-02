import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDZENSQj6ucpzna9LouizC-n9VBbAkz9eI',
    appId: '1:389703859620:web:27c0d7bf7d964c005c1531',
    messagingSenderId: '389703859620',
    projectId: 'navigation-18feb',
    authDomain: 'navigation-18feb.firebaseapp.com',
    storageBucket: 'navigation-18feb.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD_CDGXfgnRcrQdOkRNVcd0ocvY8o04AGo',
    appId: '1:389703859620:android:8f98dddf7c6d67a55c1531',
    messagingSenderId: '389703859620',
    projectId: 'navigation-18feb',
    authDomain: 'navigation-18feb.firebaseapp.com',
    storageBucket: 'navigation-18feb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDZENSQj6ucpzna9LouizC-n9VBbAkz9eI',
    appId: '1:389703859620:web:27c0d7bf7d964c005c1531',
    messagingSenderId: '389703859620',
    projectId: 'navigation-18feb',
    authDomain: 'navigation-18feb.firebaseapp.com',
    storageBucket: 'navigation-18feb.appspot.com',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDZENSQj6ucpzna9LouizC-n9VBbAkz9eI',
    appId: '1:389703859620:web:27c0d7bf7d964c005c1531',
    messagingSenderId: '389703859620',
    projectId: 'navigation-18feb',
    authDomain: 'navigation-18feb.firebaseapp.com',
    storageBucket: 'navigation-18feb.appspot.com',
  );
}

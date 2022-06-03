// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
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
    apiKey: 'AIzaSyDtuCB3nibH47lG-YMnm7UsQd_a1Myq__o',
    appId: '1:52597277371:web:70804b33a15f4a8a01df9e',
    messagingSenderId: '52597277371',
    projectId: 'heal-c011f',
    authDomain: 'heal-c011f.firebaseapp.com',
    storageBucket: 'heal-c011f.appspot.com',
    measurementId: 'G-BGJ3Z0V7JM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCfDgdqWJfCTxjefGOBbaj8CsxfhqKHouE',
    appId: '1:52597277371:android:db099241bc30265f01df9e',
    messagingSenderId: '52597277371',
    projectId: 'heal-c011f',
    storageBucket: 'heal-c011f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBoI9DmvMdOjnrvpG9aMvQ7lXlDtxeKtQU',
    appId: '1:52597277371:ios:6c09940c90a17d7a01df9e',
    messagingSenderId: '52597277371',
    projectId: 'heal-c011f',
    storageBucket: 'heal-c011f.appspot.com',
    iosClientId: '52597277371-e8c1d5mim01oq71nip4o2jjv15o39io8.apps.googleusercontent.com',
    iosBundleId: 'com.example.hnh',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBoI9DmvMdOjnrvpG9aMvQ7lXlDtxeKtQU',
    appId: '1:52597277371:ios:6c09940c90a17d7a01df9e',
    messagingSenderId: '52597277371',
    projectId: 'heal-c011f',
    storageBucket: 'heal-c011f.appspot.com',
    iosClientId: '52597277371-e8c1d5mim01oq71nip4o2jjv15o39io8.apps.googleusercontent.com',
    iosBundleId: 'com.example.hnh',
  );
}

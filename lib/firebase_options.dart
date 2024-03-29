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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyB8m-4ygvKW6f-pIhYCxsw6jDZwwbSrfIY',
    appId: '1:1012717356025:web:4a3bc332b35108ed7cb328',
    messagingSenderId: '1012717356025',
    projectId: 'login-with-other',
    authDomain: 'login-with-other.firebaseapp.com',
    storageBucket: 'login-with-other.appspot.com',
    measurementId: 'G-XND137KW5T',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBppEKrbZPLDMYO4O5YtnzTtWPiBzQJXbQ',
    appId: '1:1012717356025:android:998d194b2e6505d67cb328',
    messagingSenderId: '1012717356025',
    projectId: 'login-with-other',
    storageBucket: 'login-with-other.appspot.com',
  );
}

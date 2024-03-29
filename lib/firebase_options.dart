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
    apiKey: 'AIzaSyCwyrmTD7KFZNNnDk-Zfu7m1l-CIM1Bk9w',
    appId: '1:771354977980:web:c09daf979d5a8ca2e252b9',
    messagingSenderId: '771354977980',
    projectId: 'clinx-83904',
    authDomain: 'clinx-83904.firebaseapp.com',
    storageBucket: 'clinx-83904.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA7iEpwHVmWfrpbC60L-oWXZ0FCi5liID4',
    appId: '1:771354977980:android:e6f8966b08cf9b47e252b9',
    messagingSenderId: '771354977980',
    projectId: 'clinx-83904',
    storageBucket: 'clinx-83904.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBD4Z2CDzjV3BsKVc3Icrsjk_xhhCYXKqg',
    appId: '1:771354977980:ios:901ae41d331edbfce252b9',
    messagingSenderId: '771354977980',
    projectId: 'clinx-83904',
    storageBucket: 'clinx-83904.appspot.com',
    iosBundleId: 'com.example.clinx',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBD4Z2CDzjV3BsKVc3Icrsjk_xhhCYXKqg',
    appId: '1:771354977980:ios:1f319ab0886ca5dce252b9',
    messagingSenderId: '771354977980',
    projectId: 'clinx-83904',
    storageBucket: 'clinx-83904.appspot.com',
    iosBundleId: 'com.example.clinx.RunnerTests',
  );
}

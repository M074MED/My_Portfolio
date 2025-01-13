// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
    apiKey: 'AIzaSyBOMXw_zG0A_Pu9cKljL25M0K435rEfDLQ',
    appId: '1:955872360477:web:53584afa04ef39ced7aef4',
    messagingSenderId: '955872360477',
    projectId: 'm074med',
    authDomain: 'm074med.firebaseapp.com',
    storageBucket: 'm074med.firebasestorage.app',
    measurementId: 'G-YJFCNGHEJ0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCmlkGZAE8DuMzQ-zLC7bZ2BsOO0ZMNCeM',
    appId: '1:955872360477:android:26ae1a0353061bffd7aef4',
    messagingSenderId: '955872360477',
    projectId: 'm074med',
    storageBucket: 'm074med.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD6ocVz0FOsjGXSRuPNh4CpR2T92v7P5rE',
    appId: '1:955872360477:ios:0e5b664c43fc3a11d7aef4',
    messagingSenderId: '955872360477',
    projectId: 'm074med',
    storageBucket: 'm074med.firebasestorage.app',
    iosBundleId: 'dev.davidcobbina.portfoliosite',
  );
}
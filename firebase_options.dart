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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyCZhGkFp54bNm1UgN9MMMGo8ffvervuZXs',
    appId: '1:542285119087:web:1efb2f5a3e570eeffa579a',
    messagingSenderId: '542285119087',
    projectId: 'project2-13f9b',
    authDomain: 'project2-13f9b.firebaseapp.com',
    storageBucket: 'project2-13f9b.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCaVul8PaJf7hhzeqyIsmsPX1k7tZnR0Tc',
    appId: '1:542285119087:android:a39d0ed4f3389d68fa579a',
    messagingSenderId: '542285119087',
    projectId: 'project2-13f9b',
    storageBucket: 'project2-13f9b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCcuH0ehCr-HReLWzMRK9Rxdax3g8VnACQ',
    appId: '1:542285119087:ios:7fcaa6707b8c673efa579a',
    messagingSenderId: '542285119087',
    projectId: 'project2-13f9b',
    storageBucket: 'project2-13f9b.appspot.com',
    iosBundleId: 'com.example.project2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCcuH0ehCr-HReLWzMRK9Rxdax3g8VnACQ',
    appId: '1:542285119087:ios:7fcaa6707b8c673efa579a',
    messagingSenderId: '542285119087',
    projectId: 'project2-13f9b',
    storageBucket: 'project2-13f9b.appspot.com',
    iosBundleId: 'com.example.project2',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCZhGkFp54bNm1UgN9MMMGo8ffvervuZXs',
    appId: '1:542285119087:web:f434f3e4eaec255cfa579a',
    messagingSenderId: '542285119087',
    projectId: 'project2-13f9b',
    authDomain: 'project2-13f9b.firebaseapp.com',
    storageBucket: 'project2-13f9b.appspot.com',
  );
}

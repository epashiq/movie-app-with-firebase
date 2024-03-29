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
    apiKey: 'AIzaSyC0ZC0Bd5LiCl_uXeMZg2Lg52YCl6Tjg9k',
    appId: '1:933255068913:web:322ff3efafb0bbef18fd50',
    messagingSenderId: '933255068913',
    projectId: 'movie-app-d0908',
    authDomain: 'movie-app-d0908.firebaseapp.com',
    storageBucket: 'movie-app-d0908.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDBtki2gk8wPI5_vAPKx9vAmrsyWJNiiiM',
    appId: '1:933255068913:android:7019a44726d6586a18fd50',
    messagingSenderId: '933255068913',
    projectId: 'movie-app-d0908',
    storageBucket: 'movie-app-d0908.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDzNPmKG1PChwe8ikhLH0WaahVO3HrsuVY',
    appId: '1:933255068913:ios:4bc1bb366ba4260018fd50',
    messagingSenderId: '933255068913',
    projectId: 'movie-app-d0908',
    storageBucket: 'movie-app-d0908.appspot.com',
    iosClientId: '933255068913-bhcuqhehubgikediat56p92sa56mhaj9.apps.googleusercontent.com',
    iosBundleId: 'com.example.movieAppCleanArchitecture',
  );
}

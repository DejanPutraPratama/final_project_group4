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
    apiKey: 'AIzaSyBWnTdYBC_UYSXOu-b3OuhbpyXJAvidplM',
    appId: '1:285206891161:web:1cbfff8f5acf16abfb8608',
    messagingSenderId: '285206891161',
    projectId: 'finalprojectgroup4-6fd0a',
    authDomain: 'finalprojectgroup4-6fd0a.firebaseapp.com',
    storageBucket: 'finalprojectgroup4-6fd0a.appspot.com',
    measurementId: 'G-Y1BPW3X4QP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDWn6myFBlhzSHfDC3Hs2rpA2J2Q14jAow',
    appId: '1:285206891161:android:55550b5a2adc426bfb8608',
    messagingSenderId: '285206891161',
    projectId: 'finalprojectgroup4-6fd0a',
    storageBucket: 'finalprojectgroup4-6fd0a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDYDJKVCV57EbYkZTlxOvegdsxy74yu3Pk',
    appId: '1:285206891161:ios:bfaf260c753fdcd3fb8608',
    messagingSenderId: '285206891161',
    projectId: 'finalprojectgroup4-6fd0a',
    storageBucket: 'finalprojectgroup4-6fd0a.appspot.com',
    iosBundleId: 'com.example.finalProjectGroup4',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDYDJKVCV57EbYkZTlxOvegdsxy74yu3Pk',
    appId: '1:285206891161:ios:bfaf260c753fdcd3fb8608',
    messagingSenderId: '285206891161',
    projectId: 'finalprojectgroup4-6fd0a',
    storageBucket: 'finalprojectgroup4-6fd0a.appspot.com',
    iosBundleId: 'com.example.finalProjectGroup4',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBWnTdYBC_UYSXOu-b3OuhbpyXJAvidplM',
    appId: '1:285206891161:web:ef9b1618c1beac09fb8608',
    messagingSenderId: '285206891161',
    projectId: 'finalprojectgroup4-6fd0a',
    authDomain: 'finalprojectgroup4-6fd0a.firebaseapp.com',
    storageBucket: 'finalprojectgroup4-6fd0a.appspot.com',
    measurementId: 'G-YNWN19EKPZ',
  );

}
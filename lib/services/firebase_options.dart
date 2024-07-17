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
    apiKey: 'AIzaSyBw86mA1rzDmQHQDL5y2kJZDjUd__XR4lA',
    appId: '1:878804095340:web:91195cd26bf94109d36349',
    messagingSenderId: '878804095340',
    projectId: 'proyectom7-26ba5',
    authDomain: 'proyectom7-26ba5.firebaseapp.com',
    storageBucket: 'proyectom7-26ba5.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBUP7cLTFcSf6LaAeCtx4SCu-DgIrux97U',
    appId: '1:878804095340:android:4e1f7158a88848efd36349',
    messagingSenderId: '878804095340',
    projectId: 'proyectom7-26ba5',
    storageBucket: 'proyectom7-26ba5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBZu-F1GVZBhXThSWwZwgNhD8nfkTQzSRk',
    appId: '1:878804095340:ios:213ce3921931aed8d36349',
    messagingSenderId: '878804095340',
    projectId: 'proyectom7-26ba5',
    storageBucket: 'proyectom7-26ba5.appspot.com',
    iosBundleId: 'com.example.proyecto7',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBZu-F1GVZBhXThSWwZwgNhD8nfkTQzSRk',
    appId: '1:878804095340:ios:213ce3921931aed8d36349',
    messagingSenderId: '878804095340',
    projectId: 'proyectom7-26ba5',
    storageBucket: 'proyectom7-26ba5.appspot.com',
    iosBundleId: 'com.example.proyecto7',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBw86mA1rzDmQHQDL5y2kJZDjUd__XR4lA',
    appId: '1:878804095340:web:9a5303e3697afa60d36349',
    messagingSenderId: '878804095340',
    projectId: 'proyectom7-26ba5',
    authDomain: 'proyectom7-26ba5.firebaseapp.com',
    storageBucket: 'proyectom7-26ba5.appspot.com',
  );
}
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
    apiKey: 'AIzaSyDwU5fAxoPI-MrKLJMR7QyGAMwOt0K-9IQ',
    appId: '1:293003921094:web:224badf872104298de39c7',
    messagingSenderId: '293003921094',
    projectId: 'waypoints-c2e77',
    authDomain: 'waypoints-c2e77.firebaseapp.com',
    storageBucket: 'waypoints-c2e77.firebasestorage.app',
    measurementId: 'G-XCQQXNZF3J',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAn-WABo7SKgSw0eGxLCqi9X5vtiLd7teY',
    appId: '1:293003921094:android:35b6314991ce4d08de39c7',
    messagingSenderId: '293003921094',
    projectId: 'waypoints-c2e77',
    storageBucket: 'waypoints-c2e77.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDy-4PqyXNeGz9FHrUT9_ayNtzHNbWCQhE',
    appId: '1:293003921094:ios:ac18bc825d1c3769de39c7',
    messagingSenderId: '293003921094',
    projectId: 'waypoints-c2e77',
    storageBucket: 'waypoints-c2e77.firebasestorage.app',
    iosBundleId: 'com.example.waypointApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDy-4PqyXNeGz9FHrUT9_ayNtzHNbWCQhE',
    appId: '1:293003921094:ios:ac18bc825d1c3769de39c7',
    messagingSenderId: '293003921094',
    projectId: 'waypoints-c2e77',
    storageBucket: 'waypoints-c2e77.firebasestorage.app',
    iosBundleId: 'com.example.waypointApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDwU5fAxoPI-MrKLJMR7QyGAMwOt0K-9IQ',
    appId: '1:293003921094:web:f89b522c6c84d410de39c7',
    messagingSenderId: '293003921094',
    projectId: 'waypoints-c2e77',
    authDomain: 'waypoints-c2e77.firebaseapp.com',
    storageBucket: 'waypoints-c2e77.firebasestorage.app',
    measurementId: 'G-VLKN8VK0GN',
  );
}

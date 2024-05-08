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
    apiKey: 'AIzaSyAGDb7df3HLeoOuySAM2L-qd3YtaapDRMo',
    appId: '1:184847981670:web:a5a67727edd47fea9fa1a7',
    messagingSenderId: '184847981670',
    projectId: 'ktebi-3c8e4',
    authDomain: 'ktebi-3c8e4.firebaseapp.com',
    storageBucket: 'ktebi-3c8e4.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAQ5jWWKTsBaGcuria9KjtMbHiMeAs6LtI',
    appId: '1:184847981670:android:560a01d3fa8f5cce9fa1a7',
    messagingSenderId: '184847981670',
    projectId: 'ktebi-3c8e4',
    storageBucket: 'ktebi-3c8e4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAl1SPy0g9JIscKb79q8kj1kG7mXffAUFI',
    appId: '1:184847981670:ios:a2ca71f543713e679fa1a7',
    messagingSenderId: '184847981670',
    projectId: 'ktebi-3c8e4',
    storageBucket: 'ktebi-3c8e4.appspot.com',
    iosBundleId: 'com.example.ktebbi',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAl1SPy0g9JIscKb79q8kj1kG7mXffAUFI',
    appId: '1:184847981670:ios:9e91a6a44c0022af9fa1a7',
    messagingSenderId: '184847981670',
    projectId: 'ktebi-3c8e4',
    storageBucket: 'ktebi-3c8e4.appspot.com',
    iosBundleId: 'com.example.ktebbi.RunnerTests',
  );
}

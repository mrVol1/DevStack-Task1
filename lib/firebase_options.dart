// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
    // ignore: missing_enum_constant_in_switch
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
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBUtA_T3hLnQYZCG8NFm2w38Pl0aZTQfUY',
    appId: '1:572027888363:web:1fa19199c7a8c7dfa294ae',
    messagingSenderId: '572027888363',
    projectId: 'flutterdevstack',
    authDomain: 'flutterdevstack.firebaseapp.com',
    storageBucket: 'flutterdevstack.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAmpIqfdwKUIvVEQfeeyg-vc9hZAizdfR4',
    appId: '1:572027888363:android:db2a8428070d46d1a294ae',
    messagingSenderId: '572027888363',
    projectId: 'flutterdevstack',
    storageBucket: 'flutterdevstack.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDH617JQm62JJDb5MLFBCvsQwH_QaOt03g',
    appId: '1:572027888363:ios:1f99722413af8d85a294ae',
    messagingSenderId: '572027888363',
    projectId: 'flutterdevstack',
    storageBucket: 'flutterdevstack.appspot.com',
    iosClientId: '572027888363-a4i866ahs9lo74l3r6o1fs8c7qoeo9i8.apps.googleusercontent.com',
    iosBundleId: 'yes',
  );
}
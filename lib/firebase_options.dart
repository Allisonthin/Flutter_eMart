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
    apiKey: 'AIzaSyCDPjF7uq2rhRD9GdSaL1bn5-pkRfIKlWY',
    appId: '1:464538757610:web:bd43445cfde0d7f8d9aa93',
    messagingSenderId: '464538757610',
    projectId: 'ecommerceapp-c165a',
    authDomain: 'ecommerceapp-c165a.firebaseapp.com',
    storageBucket: 'ecommerceapp-c165a.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDzNkKZmCbb3cYJr5rmvooZYEhXKLCFOCo',
    appId: '1:464538757610:android:cb39a84be3f6607bd9aa93',
    messagingSenderId: '464538757610',
    projectId: 'ecommerceapp-c165a',
    storageBucket: 'ecommerceapp-c165a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBhUzBPvrw16UyzsJ8mjCEhTetu-owNBiY',
    appId: '1:464538757610:ios:1ad355ad619312b7d9aa93',
    messagingSenderId: '464538757610',
    projectId: 'ecommerceapp-c165a',
    storageBucket: 'ecommerceapp-c165a.appspot.com',
    androidClientId: '464538757610-56cvd6h80pk0bv80ckcdud56s763eotr.apps.googleusercontent.com',
    iosClientId: '464538757610-99o0coegpakbeg07rhggl6h5q0l4kgfd.apps.googleusercontent.com',
    iosBundleId: 'com.example.eMart',
  );
}

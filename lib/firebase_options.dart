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
    apiKey: 'AIzaSyBUWpVjolspDbWO1k0lYvO_g7O6-NkdY4k',
    appId: '1:39578539454:web:625708e30b3cbc955a15ef',
    messagingSenderId: '39578539454',
    projectId: 'todo-alper',
    authDomain: 'todo-alper.firebaseapp.com',
    storageBucket: 'todo-alper.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA3gbFGXkk_9F7EzuBpwnGa3HQY9obAnIA',
    appId: '1:39578539454:android:182822a54989bbb85a15ef',
    messagingSenderId: '39578539454',
    projectId: 'todo-alper',
    storageBucket: 'todo-alper.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCm_yn10E3gGce9R5OosI030ESqoolP94U',
    appId: '1:39578539454:ios:a6e420ad593f22f95a15ef',
    messagingSenderId: '39578539454',
    projectId: 'todo-alper',
    storageBucket: 'todo-alper.firebasestorage.app',
    iosBundleId: 'com.example.todoApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCm_yn10E3gGce9R5OosI030ESqoolP94U',
    appId: '1:39578539454:ios:a6e420ad593f22f95a15ef',
    messagingSenderId: '39578539454',
    projectId: 'todo-alper',
    storageBucket: 'todo-alper.firebasestorage.app',
    iosBundleId: 'com.example.todoApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBUWpVjolspDbWO1k0lYvO_g7O6-NkdY4k',
    appId: '1:39578539454:web:fb78e7086be4ce7b5a15ef',
    messagingSenderId: '39578539454',
    projectId: 'todo-alper',
    authDomain: 'todo-alper.firebaseapp.com',
    storageBucket: 'todo-alper.firebasestorage.app',
  );
}

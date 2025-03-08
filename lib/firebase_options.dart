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
    apiKey: 'AIzaSyAI8nxck0KTIU-FCqTKe0Pj5iQVUb4KCpA',
    appId: '1:701946266869:web:f0615b80a6fa824ee1b1bc',
    messagingSenderId: '701946266869',
    projectId: 'inventory-management-27392',
    authDomain: 'inventory-management-27392.firebaseapp.com',
    storageBucket: 'inventory-management-27392.firebasestorage.app',
    measurementId: 'G-LY7R36TVM1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCvWUcsFNRV6SdhOyWhMvctyJMfx2WHvUE',
    appId: '1:701946266869:android:f872a0fa0161e7f2e1b1bc',
    messagingSenderId: '701946266869',
    projectId: 'inventory-management-27392',
    storageBucket: 'inventory-management-27392.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBiETAaPiHAPkO8K1CkBMC2CPxkrVbc1iM',
    appId: '1:701946266869:ios:c680f3619648e0f0e1b1bc',
    messagingSenderId: '701946266869',
    projectId: 'inventory-management-27392',
    storageBucket: 'inventory-management-27392.firebasestorage.app',
    iosBundleId: 'com.example.inventoryManagementApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBiETAaPiHAPkO8K1CkBMC2CPxkrVbc1iM',
    appId: '1:701946266869:ios:c680f3619648e0f0e1b1bc',
    messagingSenderId: '701946266869',
    projectId: 'inventory-management-27392',
    storageBucket: 'inventory-management-27392.firebasestorage.app',
    iosBundleId: 'com.example.inventoryManagementApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAI8nxck0KTIU-FCqTKe0Pj5iQVUb4KCpA',
    appId: '1:701946266869:web:de605f82e20c22d3e1b1bc',
    messagingSenderId: '701946266869',
    projectId: 'inventory-management-27392',
    authDomain: 'inventory-management-27392.firebaseapp.com',
    storageBucket: 'inventory-management-27392.firebasestorage.app',
    measurementId: 'G-23WZ4SK054',
  );

}
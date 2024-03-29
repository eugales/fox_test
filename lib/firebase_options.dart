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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBMSN-XFr-Jy4vR2Lhc6gvLQDV-quv8dSQ',
    appId: '1:412483415411:android:895dc262d2cbf3c0e7e906',
    messagingSenderId: '412483415411',
    projectId: 'tamaq-work-v1',
    databaseURL: 'https://tamaq-work-v1-default-rtdb.firebaseio.com',
    storageBucket: 'tamaq-work-v1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCZG1X2ZGH8nxivA7t-UuCPyoIWX6Ziun8',
    appId: '1:412483415411:ios:51a2c68f726f764ce7e906',
    messagingSenderId: '412483415411',
    projectId: 'tamaq-work-v1',
    databaseURL: 'https://tamaq-work-v1-default-rtdb.firebaseio.com',
    storageBucket: 'tamaq-work-v1.appspot.com',
    iosClientId: '412483415411-i1sulf2mvvpvq9movkc78q1fsj0lb6i4.apps.googleusercontent.com',
    iosBundleId: 'kz.eugales.yt',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCZG1X2ZGH8nxivA7t-UuCPyoIWX6Ziun8',
    appId: '1:412483415411:ios:51a2c68f726f764ce7e906',
    messagingSenderId: '412483415411',
    projectId: 'tamaq-work-v1',
    databaseURL: 'https://tamaq-work-v1-default-rtdb.firebaseio.com',
    storageBucket: 'tamaq-work-v1.appspot.com',
    iosClientId: '412483415411-i1sulf2mvvpvq9movkc78q1fsj0lb6i4.apps.googleusercontent.com',
    iosBundleId: 'kz.eugales.yt',
  );
}

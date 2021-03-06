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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD5XhgrMr4q1Yn0ctIV3KvDVLToRIyhjCI',
    appId: '1:1076570514611:android:bc6e1ec9cec08cec70bcc6',
    messagingSenderId: '1076570514611',
    projectId: 'gangapp-nebulova',
    storageBucket: 'gangapp-9b116.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD5XhgrMr4q1Yn0ctIV3KvDVLToRIyhjCI',
    appId: '1:1076570514611:ios:e0851564598b7f4a70bcc6',
    messagingSenderId: '1076570514611',
    projectId: 'gangapp-nebulova',
    storageBucket: 'gangapp-9b116.appspot.com',
    iosClientId: '1076570514611-i164f6jjd4fe7ksb2qloi6iip2tltnsm.apps.googleusercontent.com',
    iosBundleId: 'com.example.gangApp',
  );
}
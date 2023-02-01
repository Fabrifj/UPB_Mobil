import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class FirebaseConfiguration {
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
    apiKey: 'AIzaSyA1kza2SqVYumM-3kR_Vc2xOaO2ecga8CE',
    appId: '1:591068045084:web:d569d66768ca076d5164d9',
    messagingSenderId: '591068045084',
    projectId: 'upbweb-1c67d',
    authDomain: 'upbweb-1c67d.firebaseapp.com',
    storageBucket: 'upbweb-1c67d.appspot.com',
    measurementId: 'G-1B0QJ5H912',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAMVxcUtbBInt1zg5YEmcZwIc0HnunFWUg',
    appId: '1:591068045084:android:3a157ef589f4dbfb5164d9',
    messagingSenderId: '591068045084',
    projectId: 'upbweb-1c67d',
    storageBucket: 'upbweb-1c67d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDjbUOhjM4xqPs-TUUdG621qXynOzWhLW0',
    appId: '1:591068045084:ios:291ffe1d7c1059e25164d9',
    messagingSenderId: '591068045084',
    projectId: 'upbweb-1c67d',
    storageBucket: 'upbweb-1c67d.appspot.com',
    iosClientId: '591068045084-kualepdl1n3fbvugisj21t15n9pek1ot.apps.googleusercontent.com',
    iosBundleId: 'com.example.upbWeb',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDjbUOhjM4xqPs-TUUdG621qXynOzWhLW0',
    appId: '1:591068045084:ios:291ffe1d7c1059e25164d9',
    messagingSenderId: '591068045084',
    projectId: 'upbweb-1c67d',
    storageBucket: 'upbweb-1c67d.appspot.com',
    iosClientId: '591068045084-kualepdl1n3fbvugisj21t15n9pek1ot.apps.googleusercontent.com',
    iosBundleId: 'com.example.upbWeb',
  );
}

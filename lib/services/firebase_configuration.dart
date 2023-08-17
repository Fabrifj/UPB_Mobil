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
  //   static const FirebaseOptions android = FirebaseOptions(
  //   apiKey: 'cf7c049816c2df1299152471c27da5c814bb6a7f',
  //   appId: '1:575891042528:android:6c765aaeacbe37c0dbe085',
  //   messagingSenderId: '591068045084',
  //   projectId: 'upbmobil',
  //   storageBucket: 'upbweb-1c67d.appspot.com',
  // );
//   {
//   "type": "service_account",
//   "project_id": "upbmobil",
//   "private_key_id": "cf7c049816c2df1299152471c27da5c814bb6a7f",
//   "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCihSXeYtcXEf3N\nMxcNllrwnEZ2VfQVFNPRwyaBxWScfxBQzXRvkai7rRfQfVZCbM0u2BwGXXdD7U5w\n+w38BDjDZeF8to59cmLYAJZK/8BAG8TAvDNL6byU1SWONXZTXZ3QKzdFITAWbc86\nC02L1yZwR0s8KBleun/DWCueDoX8ETDEqSV5mPbZ1yR7FBPCycfJOBe5Iwf9gllU\nfr6ssmT6dkjwodrZmEKtEXmTkR7qtlG0/aqSm3XqET1UKmj8ECZfm0L4Es6GLUgs\nt45GdP7yXGXoJmv1oohyItz+lHsIy5M+ysmlMNS97dpzZw+HK2If96/DhBR+4gP+\nInOKfD+PAgMBAAECggEAE5isepvpGu4KGsPDTtnHY2XklSuYv9tVYzX9yai3O1Y9\nmGX9ropIvJXgM5KOuSRiD/jyVXjQWGTKkD2lb7LunpkFTxgQJw4ziZ911TCbdN95\nolJ5zk3ZIF/HJID2deeUOjVLzSPK/EQHYxSufWMsTl46XdQ+ouPSuLJD/XimLUDl\ne7MRprCLRPhepOq+vZdC5/1FPYK52sU5UD1Ap+DZY50nuVQ9EKCfeS2z88vwiyQk\nxVH6Q7Z8jOW420UD8juIkwLWI8oPypzjqncPg1B1aPMAwH4FlW3qWIxuBeF6c1SK\nf9FzTGQY29sEpE+vaxcncWFPCysdvf3SfJ5jU+MxiQKBgQDVfkA4NlMMupQpsvRO\nh2m0cIF896sdLqiRPwY2SwmlmKAN4yAer3OkCCRcxcHhGv/k2ksWK8QisvK/w1WD\ndoFQio5lAUKhjNR57rYbhS1cQZJGMOz/9Wt9T1Ld3Lx4TaT5JYfOIEMhvZ4GVl5p\nGxE5FNB5G/GblR+QQ+sHSFjHYwKBgQDC4My52SDa/NC47xrYu+NehH7YLIPZOQeh\nGNqhM/cU/8/higPB/UZMBUPEJ1foMsF5lNxtMQ0SSwiT1+PQJ3zMGI9Z6R05yqSX\nXRItBFbkVQ3A9uZK5k3V6rBsxSTf260Xi0NVxzqx+hXIBOvDFri1THs5DtgEfbPL\nNp6HV8XM5QKBgQCmDK0sS2xq4Q9uI2cLUR0xH7RHG2b2qpynY8qUHebh6oTKaFZK\nJ5KdCUwm8BUs3VAckoCGPQIvLtnJtsbjGh/YIfxAqStG9X8pWzY+z2WJdOKtP06G\ngj7ZVwIP16irNVDUC5HGC6fLLW0kZrbFryzFJeBD4i0YInNLRNgfcPDEGwKBgAhN\nW2tvfJ7XtmyqgxJIrt8P9fdvrg5LB7AtRuMnO5eBbnHFV3OkPqJudvycUHpr7yIm\n3V0pgc0NtUfXIrVzeTWYtkK2U7Bqmah5JpUUYj9IAFYALr9yIE7EuM9pdrCywyUF\nodC9tBpw9QyYaRLenO/cWkOMBlfqowY9RXOuoZahAoGAOkpUkhF2KJhAMAq8Hq81\nPfGGubuT8wYZRi4ZkEpg98cXyQcWK6XZraSyjy8MA306mOIy+l31IvwNKNyi/cLY\nbaAA3Agt9HW8suso9TjwjLqWcubx1eSoMhjTHwnfgc1x0sAstm8crhzMQASs5R7N\nHrYsmH0l9R1egpQWG8yLA5c=\n-----END PRIVATE KEY-----\n",
//   "client_email": "firebase-adminsdk-k66y7@upbmobil.iam.gserviceaccount.com",
//   "client_id": "107409173627500729330",
//   "auth_uri": "https://accounts.google.com/o/oauth2/auth",
//   "token_uri": "https://oauth2.googleapis.com/token",
//   "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
//   "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-k66y7%40upbmobil.iam.gserviceaccount.com"
// }


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

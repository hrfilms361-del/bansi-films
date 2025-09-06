import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show kIsWeb;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return const FirebaseOptions(
        apiKey: "REPLACE_WITH_YOURS",
        appId: "REPLACE_WITH_YOURS",
        messagingSenderId: "REPLACE_WITH_YOURS",
        projectId: "REPLACE_WITH_YOURS",
        storageBucket: "REPLACE_WITH_YOURS",
        authDomain: "REPLACE_WITH_YOURS.firebaseapp.com",
        measurementId: "G-REPLACE",
      );
    }
    return const FirebaseOptions(
      apiKey: "android_dummy",
      appId: "android_dummy",
      messagingSenderId: "0",
      projectId: "dummy",
    );
  }
}

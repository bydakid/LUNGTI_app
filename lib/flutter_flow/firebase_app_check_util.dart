import 'package:firebase_app_check/firebase_app_check.dart';

Future initializeFirebaseAppCheck() => FirebaseAppCheck.instance.activate(
      webRecaptchaSiteKey: '6Lf0T6MnAAAAAGIdSlcSEY-bmfUe0x9_dfUqawTi',
      androidProvider: AndroidProvider.playIntegrity,
    );

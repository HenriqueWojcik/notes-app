import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseHelper {
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;

  FirebaseHelper({
    required this.firebaseAuth,
    required this.googleSignIn,
  });

  static Future<void> init() async {
    await Firebase.initializeApp();
  }
}

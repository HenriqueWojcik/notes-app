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

  Future<User> loginWithGoogle() async {
    final googleUser = await googleSignIn.signIn();

    if (googleUser == null) {
      throw Exception('Google sign in failed');
    }

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final userCredential = await firebaseAuth.signInWithCredential(credential);

    final user = userCredential.user;

    if (user == null) {
      throw Exception('Firebase sign in failed');
    }

    return user;
  }
}

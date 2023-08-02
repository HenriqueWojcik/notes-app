import 'package:flutter_notes_app/core/authentication/firebase_helper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'mock/mocks.mocks.dart';

void main() {
  late FirebaseHelper sut;
  late MockFirebaseAuth firebaseAuth;
  late MockGoogleSignIn googleSignIn;

  setUp(() {
    firebaseAuth = MockFirebaseAuth();
    googleSignIn = MockGoogleSignIn();

    sut = FirebaseHelper(
      firebaseAuth: firebaseAuth,
      googleSignIn: googleSignIn,
    );
  });

  test('should return google user when login is successfully', () async {
    final googleUser = MockGoogleSignInAccount();
    final signInAuthentication = MockGoogleSignInAuthentication();
    final userCrendential = MockUserCredential();
    final user = MockUser();

    when(googleSignIn.signIn()).thenAnswer((_) async => googleUser);

    when(googleUser.authentication)
        .thenAnswer((_) async => signInAuthentication);

    when(signInAuthentication.accessToken).thenReturn('accessToken');
    when(signInAuthentication.idToken).thenReturn('idToken');

    when(firebaseAuth.signInWithCredential(any))
        .thenAnswer((_) async => userCrendential);

    when(userCrendential.user).thenReturn(user);

    final result = await sut.loginWithGoogle();

    expect(result, user);
  });

  test('should throw Exception when google sign in failed', () async {
    when(googleSignIn.signIn()).thenAnswer((_) async => null);

    expect(() => sut.loginWithGoogle(), throwsException);
  });

  test('should throw Exception when singInWithCrendential fails', () async {
    final googleUser = MockGoogleSignInAccount();
    final signInAuthentication = MockGoogleSignInAuthentication();
    final userCrendential = MockUserCredential();

    when(googleSignIn.signIn()).thenAnswer((_) async => googleUser);

    when(googleUser.authentication)
        .thenAnswer((_) async => signInAuthentication);

    when(signInAuthentication.accessToken).thenReturn('accessToken');
    when(signInAuthentication.idToken).thenReturn('idToken');

    when(firebaseAuth.signInWithCredential(any))
        .thenAnswer((_) async => userCrendential);

    when(userCrendential.user).thenReturn(null);

    expect(() => sut.loginWithGoogle(), throwsException);
  });
}

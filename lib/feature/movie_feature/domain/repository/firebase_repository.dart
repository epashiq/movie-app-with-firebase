import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationRepository {
  Future<UserCredential> loginAuth(String email, String password);
  Future<UserCredential> signupAuth(String email, String password);
  Future<void>verifyEmail();
  Future<void>signInWithGoogle();
  Future<void>logOut();
}

import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationDataSource{
  Future<UserCredential>loginAuth(String email,String password);
  Future<UserCredential>signUpAuth(String email,String password);
  Future<void>verifyEmail();
  Future<void>signInWithGoogle();
  Future<void>logOut();

  
}
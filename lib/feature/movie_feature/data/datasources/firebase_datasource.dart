import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationDataSource{
  Future<UserCredential>loginAuth(String email,String password);
  Future<UserCredential>signUpAuth(String email,String password);
  Future<void>verifyEmail();
  Future<void>signInWithGoogle();
  Future<void>passwordReset(String email);
  Future<(String, int?)>verifyPhoneNumber(String number);
  Future<void>verifyOtp(String verificationId ,String otp, );
  Future<void>logOut();
}
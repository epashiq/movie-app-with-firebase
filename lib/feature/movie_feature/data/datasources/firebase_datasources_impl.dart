import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movie_app_clean_architecture/core/exeptions/authentication/auth_failed_exception.dart';
import 'package:movie_app_clean_architecture/feature/movie_feature/data/datasources/firebase_datasource.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'firebase_datasources_impl.g.dart';

class AuthenticationDataSourceImpl implements AuthenticationDataSource {
  final FirebaseAuth _auth;
  AuthenticationDataSourceImpl(this._auth);
  @override
  Future<UserCredential> loginAuth(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw AuthenticationFailedException('wrong email address');
      } else if (e.code == 'wrong-password') {
        throw AuthenticationFailedException('wrong password');
      } else if (e.code == 'user-disabled:') {
        throw AuthenticationFailedException('user isdisabled');
      }
    }
    return loginAuth(email, password);
  }

  @override
  Future<UserCredential> signUpAuth(String email, String password) async {
    try {} on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw AuthenticationFailedException('password is weak');
      } else if (e.code == 'email-already-in-use') {
        throw AuthenticationFailedException(
            'The account already exists for that email');
      }
    } catch (e) {}
    return await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  @override
  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Future<void> verifyEmail() async {
    await FirebaseAuth.instance.currentUser?.sendEmailVerification();
  }

  @override
  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Future<(String, int?)> verifyPhoneNumber(String number,
      [int? resendToken]) async {
    try {
      final verificationIdCompleter = Completer<String>();
      final resendTokenComleter = Completer<int?>();

      await FirebaseAuth.instance.verifyPhoneNumber(
          forceResendingToken: resendToken,
          phoneNumber: number,
          verificationCompleted: (PhoneAuthCredential credential) async {
            log('completed');
            await _auth.signInWithCredential(credential);
          },
          verificationFailed: (FirebaseAuthException e) {
            if (e.code == 'invalid phone number') {}
          },
          codeSent: (String? verificationId, int? resendToken) async {
            verificationIdCompleter.complete(verificationId);
            resendTokenComleter.complete(resendToken);
          },
          codeAutoRetrievalTimeout: (String verificationId) async {
            log('Timeout');
          });

      final verificationId = await verificationIdCompleter.future;
      final newResendToken = await resendTokenComleter.future;
      return (verificationId, newResendToken);
    } on Exception {
      throw AuthenticationFailedException(
          'cannot login please try again later');
    }
  }

  @override
  Future<void> passwordReset(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  @override
  Future<void> verifyOtp(String verificationId, String otp, ) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: otp);
        await FirebaseAuth.instance.signInWithCredential(credential);
  }
}

@riverpod
AuthenticationDataSource authenticationDataSource(
    AuthenticationDataSourceRef ref) {
  return AuthenticationDataSourceImpl(FirebaseAuth.instance);
}

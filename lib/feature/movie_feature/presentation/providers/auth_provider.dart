import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app_clean_architecture/core/exeptions/base_exception.dart';
import 'package:movie_app_clean_architecture/core/utils/utils.dart';
import 'package:movie_app_clean_architecture/feature/movie_feature/data/repository/firebase_repository_impl.dart';
import 'package:movie_app_clean_architecture/feature/movie_feature/domain/repository/firebase_repository.dart';
import 'package:movie_app_clean_architecture/feature/movie_feature/domain/usecase/login_usecase.dart';
import 'package:movie_app_clean_architecture/feature/movie_feature/domain/usecase/logout_usecase.dart';
import 'package:movie_app_clean_architecture/feature/movie_feature/domain/usecase/resetpassword_usecase.dart';
import 'package:movie_app_clean_architecture/feature/movie_feature/domain/usecase/sign_usecase.dart';
import 'package:movie_app_clean_architecture/feature/movie_feature/domain/usecase/signin_with_google_usecase.dart';
import 'package:movie_app_clean_architecture/feature/movie_feature/domain/usecase/verify_email_usecase.dart';
import 'package:movie_app_clean_architecture/feature/movie_feature/domain/usecase/verify_otp_usecase.dart';
import 'package:movie_app_clean_architecture/feature/movie_feature/domain/usecase/verify_phonenumber_usecase.dart';
import 'package:movie_app_clean_architecture/feature/movie_feature/presentation/pages/home_page.dart';
import 'package:movie_app_clean_architecture/feature/movie_feature/presentation/pages/login_page.dart';
import 'package:movie_app_clean_architecture/feature/movie_feature/presentation/pages/otp_verification_page.dart';
import 'package:movie_app_clean_architecture/feature/movie_feature/presentation/providers/auth_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
class Authentication extends _$Authentication {
  late final AuthenticationRepository repository;
  @override
  AuthState build() {
    repository = ref.read(authenticationRepositoryProvider);
    return AuthState(verificationId: '', resendToken: null);
  }

  Future<void> signUpAuth(
      String email, String password, BuildContext context) async {
    try {
      await SignUpUseCase(repository: repository)(email, password);
      Future.sync(() => verifyEmail(context));
      Future.sync(() => context.go(HomePage.routePath));
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showMessage(context, e.message));
    }
  }

  Future<void> loginAuth(
      String email, String password, BuildContext context) async {
    try {
      await LoginUseCase(repository: repository)(email, password);
      Future.sync(() => context.go(HomePage.routePath));
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showMessage(context, e.message));
    }
  }

  Future<void> verifyEmail(BuildContext context) async {
    try {
      await VerifyEmailUsecase(repository: repository)();
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showMessage(context, e.message));
    }
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      await SignInWithGoogleUsecase(repository: repository)();
      Future.sync(() => context.go(HomePage.routePath));
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showMessage(context, e.message));
    }
  }

  Future<void> resetPassword(BuildContext context, String email) async {
    try {
      await ResetPasswordUsecase(repository: repository)();
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showMessage(context, e.message));
    }
  }

  Future<void> verifyPhoneNumber(String number, BuildContext context) async {
    try {
      final verificationData =
          await VerifyPhoneNumberUsecase(repository: repository)(number);
      state = AuthState(
          verificationId: verificationData.$1,
          resendToken: verificationData.$2);
      Future.sync(() => context.go(OtpVerification.routPath));
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showMessage(context, e.message));
    }
  }

  Future<void> verifyOtp(BuildContext context, String otp) async {
    try {
      await VerifyOtpUsecase(repository: repository)(state.verificationId, otp);
      Future.sync(() => context.go(HomePage.routePath));
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showMessage(context, e.message));
    }
  }

  Future<void> logOut(BuildContext context) async {
    try {
      await LogOutUseCase(repository: repository)();
      Future.sync(() => context.go(LoginPage.routPath));
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showMessage(context, e.message));
    }
  }
}

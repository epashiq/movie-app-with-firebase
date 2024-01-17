import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app_clean_architecture/core/exeptions/base_exception.dart';
import 'package:movie_app_clean_architecture/core/utils/utils.dart';
import 'package:movie_app_clean_architecture/feature/movie_feature/data/repository/firebase_repository_impl.dart';
import 'package:movie_app_clean_architecture/feature/movie_feature/domain/repository/firebase_repository.dart';
import 'package:movie_app_clean_architecture/feature/movie_feature/domain/usecase/login_usecase.dart';
import 'package:movie_app_clean_architecture/feature/movie_feature/domain/usecase/logout_usecase.dart';
import 'package:movie_app_clean_architecture/feature/movie_feature/domain/usecase/sign_usecase.dart';
import 'package:movie_app_clean_architecture/feature/movie_feature/domain/usecase/signin_with_google_usecase.dart';
import 'package:movie_app_clean_architecture/feature/movie_feature/domain/usecase/verify_email_usecase.dart';
import 'package:movie_app_clean_architecture/feature/movie_feature/presentation/pages/home_page.dart';
import 'package:movie_app_clean_architecture/feature/movie_feature/presentation/pages/login_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'auth_provider.g.dart';

@riverpod
class Authentication extends _$Authentication {
  late final AuthenticationRepository repository;
  @override
  void build() {
    repository = ref.read(authenticationRepositoryProvider);
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

  Future<void>signInWithGoogle(BuildContext context)async{
    try{
      await SignInWithGoogleUsecase(repository: repository)();
      Future.sync(() => context.go(HomePage.routePath));
    }on BaseException catch(e){
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

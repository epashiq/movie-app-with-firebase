import 'package:movie_app_clean_architecture/core/exeptions/authentication/auth_failed_exception.dart';
import 'package:movie_app_clean_architecture/feature/movie_feature/domain/repository/firebase_repository.dart';

final class SignInWithGoogleUsecase {
  final AuthenticationRepository repository;
  SignInWithGoogleUsecase({required this.repository});
  Future<void> call() async {
    try {
      await repository.signInWithGoogle();
    } on Exception {
      throw AuthenticationFailedException(
          'cannot signin with google please try again later');
    }
  }
}

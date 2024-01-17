import 'package:movie_app_clean_architecture/core/exeptions/authentication/auth_failed_exception.dart';
import 'package:movie_app_clean_architecture/feature/movie_feature/domain/repository/firebase_repository.dart';

final class VerifyEmailUsecase {
  final AuthenticationRepository repository;
  VerifyEmailUsecase({required this.repository});
  Future<void> call() async {
    try {
      await repository.verifyEmail();
    } on Exception  {
      throw AuthenticationFailedException(
          'cannot verify email please try again later');
    }
  }
}

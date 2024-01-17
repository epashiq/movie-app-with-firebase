import 'package:movie_app_clean_architecture/core/exeptions/authentication/auth_failed_exception.dart';
import 'package:movie_app_clean_architecture/feature/movie_feature/domain/repository/firebase_repository.dart';

class LogOutUseCase {
  final AuthenticationRepository repository;
  LogOutUseCase({required this.repository});
  Future<void> call() async {
    try {
     await repository.logOut();
    } on Exception {
      throw AuthenticationFailedException(
          'cannot logout please try again later');
    }
  }
}

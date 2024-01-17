import 'package:movie_app_clean_architecture/core/exeptions/authentication/auth_failed_exception.dart';
import 'package:movie_app_clean_architecture/core/exeptions/authentication/invalid_credential_exception.dart';
import 'package:movie_app_clean_architecture/feature/movie_feature/domain/repository/firebase_repository.dart';

class LoginUseCase {
  final AuthenticationRepository repository;
  LoginUseCase({required this.repository});
  Future<void> call(String email, String password) async {
    if (email.trim().isEmpty || password.trim().isEmpty) {
      throw InvalidCredentialException();
    }
    try {
      await repository.loginAuth(email, password);
    } on Exception {
      throw AuthenticationFailedException(
          'cannot login please try again later');
    }
  }
}

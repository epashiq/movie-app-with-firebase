import 'package:movie_app_clean_architecture/core/exeptions/authentication/auth_failed_exception.dart';
import 'package:movie_app_clean_architecture/core/exeptions/authentication/invalid_credential_exception.dart';
import 'package:movie_app_clean_architecture/feature/movie_feature/domain/repository/firebase_repository.dart';

final class SignUpUseCase {
  final AuthenticationRepository repository;
  SignUpUseCase({required this.repository});
  Future<void> call(String email, String password) async {
    if (email.trim().isEmpty || password.trim().isEmpty) {
      throw InvalidCredentialException();
    }
    try {
      await repository.signupAuth(email, password);
    }on Exception  {
      throw AuthenticationFailedException('Cannot signup. please try again');
    }
  }
}

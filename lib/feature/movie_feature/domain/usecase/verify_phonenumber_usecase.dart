import 'package:movie_app_clean_architecture/core/exeptions/authentication/invalid_credential_exception.dart';
import 'package:movie_app_clean_architecture/core/exeptions/base_exception.dart';
import 'package:movie_app_clean_architecture/feature/movie_feature/domain/repository/firebase_repository.dart';

final class VerifyPhoneNumberUsecase {
  final AuthenticationRepository repository;
  VerifyPhoneNumberUsecase({required this.repository});
  Future<(String, int?)> call(String number) async {
    if (number.trim().isEmpty) {
      throw InvalidCredentialException();
    }
    try {
      return await repository.verifyPhoneNumber(number);
    } on Exception {
      throw BaseException('An error occured');
    }
  }
}

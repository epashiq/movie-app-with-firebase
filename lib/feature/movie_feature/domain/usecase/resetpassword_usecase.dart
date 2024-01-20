import 'package:movie_app_clean_architecture/core/exeptions/authentication/auth_failed_exception.dart';
import 'package:movie_app_clean_architecture/feature/movie_feature/domain/repository/firebase_repository.dart';

final class ResetPasswordUsecase{
  final AuthenticationRepository repository;
  ResetPasswordUsecase({required this.repository});
  Future<void>call()async{
    try{
      await repository.passwordReset('ashiqashi4715@gmail.com');
    }on Exception{
      throw AuthenticationFailedException('cannot reset password please try again later');
    }
  }
}
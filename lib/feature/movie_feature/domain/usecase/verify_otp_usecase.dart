import 'package:movie_app_clean_architecture/core/exeptions/base_exception.dart';
import 'package:movie_app_clean_architecture/feature/movie_feature/domain/repository/firebase_repository.dart';

final class VerifyOtpUsecase{
  final AuthenticationRepository repository;
  VerifyOtpUsecase({required this.repository});
  Future<void>call(String verificationId,String otp)async{
    try{
      await repository.verifyOtp(verificationId, otp);
    }on Exception{
      throw BaseException('verification failed please try again later');
    }
  }
}
import 'package:movie_app_clean_architecture/core/exeptions/base_exception.dart';

class AuthenticationFailedException extends BaseException{
  AuthenticationFailedException(String reason):super(reason);
}
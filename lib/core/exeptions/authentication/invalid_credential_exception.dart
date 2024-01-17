import 'package:movie_app_clean_architecture/core/exeptions/base_exception.dart';

class InvalidCredentialException extends BaseException{
InvalidCredentialException():super('invalid user input');
}
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_app_clean_architecture/feature/movie_feature/data/datasources/firebase_datasource.dart';
import 'package:movie_app_clean_architecture/feature/movie_feature/data/datasources/firebase_datasources_impl.dart';
import 'package:movie_app_clean_architecture/feature/movie_feature/domain/repository/firebase_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'firebase_repository_impl.g.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationDataSource datasources;
  AuthenticationRepositoryImpl({required this.datasources});

  @override
  Future<UserCredential> loginAuth(String email, String password) async {
    return datasources.loginAuth(email, password);
  }

  @override
  Future<UserCredential> signupAuth(String email, String password) async {
    return await datasources.signUpAuth(email, password);
  }

  @override
  Future<void> logOut() async {
    await datasources.logOut();
  }

  @override
  Future<void> verifyEmail() async {
    await datasources.verifyEmail();
  }
  
  @override
  Future<void> signInWithGoogle()async {
    datasources.signInWithGoogle();
  }
}

@riverpod
AuthenticationRepository authenticationRepository(
    AuthenticationRepositoryRef ref) {
  return AuthenticationRepositoryImpl(
      datasources: ref.read(authenticationDataSourceProvider));
}

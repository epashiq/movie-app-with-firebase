import 'package:movie_app_clean_architecture/core/exeptions/base_exception.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/domain/entity/api_movie_entity.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/domain/repository/firebase_repository.dart';

final class GetAllMoviesUsecase {
  FirebaseRepository repository;
  GetAllMoviesUsecase({required this.repository});
  Stream<List<ApiEntity>> call() {
    try {
      return repository.getAllMovies();
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}

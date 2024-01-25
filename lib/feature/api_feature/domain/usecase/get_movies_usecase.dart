import 'package:movie_app_clean_architecture/core/exeptions/get_movies_exception.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/domain/entity/api_movie_entity.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/domain/repository/movie_repository.dart';

final class GetMoviesUsecase {
  final ApiMovieRepository repository;
  GetMoviesUsecase({required this.repository});

  Future<List<ApiEntity>> call() async {
    try {
      return repository.fetchMovies();
    } on Exception {
      throw GetMoviesException('No movie found');
    }
  }
}

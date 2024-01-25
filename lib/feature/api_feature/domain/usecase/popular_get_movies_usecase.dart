import 'package:movie_app_clean_architecture/core/exeptions/get_movies_exception.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/domain/entity/api_movie_entity.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/domain/repository/popular_movie_repository.dart';

final class PopularMovieUsecase {
  final PopularMoviesRepository repository;
  PopularMovieUsecase({required this.repository});
  Future<List<ApiEntity>> call() async {
    try {
      return repository.getMovies();
    } on Exception {
      throw GetMoviesException('movies not found');
    }
  }
}

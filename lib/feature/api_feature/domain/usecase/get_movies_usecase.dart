import 'package:movie_app_clean_architecture/core/exeptions/get_movies_exception.dart';
import 'package:movie_app_clean_architecture/core/utils/network_utils.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/domain/entity/api_movie_entity.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/domain/repository/movie_repository.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/domain/repository/objectbox_repository.dart';

final class GetMoviesUsecase {
  final ApiMovieRepository repository;
  final ObjectBoxRepository obRepository;
  GetMoviesUsecase({required this.repository, required this.obRepository});

  Future<List<ApiEntity>> call() async {
    try {
      if (await NetworkUtils.hasNetwork()) {
        final data = await repository.fetchMovies();
        obRepository.clearAll();
        obRepository.addMovies(data);
        return data;
      } else {
        final localData = obRepository.getMovies();
        return localData;
      }
    } catch (e) {
      throw GetMoviesException('No movie found: $e');
    }
  }
}

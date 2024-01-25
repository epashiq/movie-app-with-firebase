
import 'package:movie_app_clean_architecture/feature/api_feature/domain/entity/api_movie_entity.dart';

abstract class PopularMoviesRepository{
  Future<List<ApiEntity>>getMovies();
}
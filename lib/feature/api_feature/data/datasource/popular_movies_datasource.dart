
import 'package:movie_app_clean_architecture/feature/api_feature/data/model/popular_movies_model.dart';

abstract class PopularMoviesDatasource{
  Future<PopularMoviesModel>getMovies();
}
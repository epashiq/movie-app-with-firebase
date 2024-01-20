import 'package:movie_app_clean_architecture/feature/api_feature/data/model/movie_api_model.dart';

abstract class ApiServiceDataSource{
  Future<MovieModel>fetchMovies();
}
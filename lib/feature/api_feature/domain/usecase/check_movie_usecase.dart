import 'package:movie_app_clean_architecture/feature/api_feature/domain/entity/api_movie_entity.dart';

final class CheckMovieUsecase{
  bool call(int movieId, List<ApiEntity>allMovies){
    for(final movie in allMovies){
      if(movie.id==movieId){
        return true;
      }
    }
    return false;
  }
}
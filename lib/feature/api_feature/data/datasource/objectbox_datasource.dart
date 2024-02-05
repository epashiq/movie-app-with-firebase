import 'package:movie_app_clean_architecture/feature/api_feature/data/model/movie_model_entity.dart';

abstract class ObjectBoxDatasource{
  void addMovies(List<MovieModelEntity>entityModel);
    List<MovieModelEntity>getMovies();
    void clearAll();
  
}
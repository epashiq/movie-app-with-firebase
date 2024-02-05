import 'package:movie_app_clean_architecture/feature/api_feature/domain/entity/api_movie_entity.dart';

abstract class ObjectBoxRepository{
  void addMovies(List<ApiEntity>entity);
  List<ApiEntity>getMovies();
  void clearAll();
}
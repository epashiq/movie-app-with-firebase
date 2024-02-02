import 'package:movie_app_clean_architecture/core/exeptions/base_exception.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/domain/entity/api_movie_entity.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/domain/repository/movie_repository.dart';

final class SearchMovieUsecase{
  final ApiMovieRepository repository;
  SearchMovieUsecase({required this.repository});
  Future<List<ApiEntity>>call(String text)async{
    try{
    return await repository.serachMovies(text);
    }catch (e){
      throw BaseException(e.toString());
    }
  }
}
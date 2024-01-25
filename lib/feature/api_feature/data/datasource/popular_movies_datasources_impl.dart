
import 'package:dio/dio.dart';
import 'package:movie_app_clean_architecture/core/constants/home_page_constants/api_constants.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/data/datasource/popular_movies_datasource.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/data/model/popular_movies_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'popular_movies_datasources_impl.g.dart';

class PopularMoviesDatasourceImpl implements PopularMoviesDatasource {
  final dio = Dio();
  final token = ApiConstants.popToken;
  @override
  Future<PopularMoviesModel> getMovies() async {
    dio.options.headers['Authorization'] = 'Bearer $token';
    Response resp =
        await dio.get('https://api.themoviedb.org/3/movie/upcoming');

    return PopularMoviesModel.fromJson(resp.data);
  }
}

@riverpod
PopularMoviesDatasource popularMoviesDatasource(
    PopularMoviesDatasourceRef ref) {
  return PopularMoviesDatasourceImpl();
}

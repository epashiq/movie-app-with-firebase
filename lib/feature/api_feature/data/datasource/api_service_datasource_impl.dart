import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:movie_app_clean_architecture/core/constants/home_page_constants/api_constants.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/data/datasource/api_service_datasource.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/data/model/movie_api_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_service_datasource_impl.g.dart';

class ApiServiceDataSourceImpl implements ApiServiceDataSource {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  static final Dio dio = Dio();
  final token = ApiConstants.token;
  @override
  Future<MovieModel> fetchMovies() async {
    dio.options.headers['Authorization'] = 'Bearer $token';
    Response resp = await dio.get(
        'https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=5&sort_by=popularity.desc');

    return MovieModel.fromJson(resp.data);
  }

  @override
  Future<MovieModel> serchMovies(String text) async {
    dio.options.headers['Authorization'] = 'Bearer $token';
    Response resp = await dio
        .get('https://api.themoviedb.org/3/search/movie', queryParameters: {
      'query': text,
      'include_adult': false,
      'language': 'en-US',
      'page': 1,
    });
    return MovieModel.fromJson(resp.data);
  }
}

@riverpod
ApiServiceDataSource apiServiceDataSource(ApiServiceDataSourceRef ref) {
  return ApiServiceDataSourceImpl();
}

import 'package:dio/dio.dart';
import 'package:movie_app_clean_architecture/core/constants/home_page_constants/api_constants.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/data/datasource/trailer_datasource.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/data/model/trailer_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'trailer_datasource_impl.g.dart';

class TrailerDataSourceImpl implements TrailerDataSource{
  final dio = Dio();
  final token = ApiConstants.token;
  @override
  Future<TrailerModel> getTrailer(String id)async {
    dio.options.headers['Authorization'] = 'Bearer $token';
    Response resp = await dio.get('https://api.themoviedb.org/3/movie/$id/videos');
    return TrailerModel.fromJson(resp.data);
  }

}
@riverpod
TrailerDataSource trailerDataSource(TrailerDataSourceRef ref){
  return TrailerDataSourceImpl();
}
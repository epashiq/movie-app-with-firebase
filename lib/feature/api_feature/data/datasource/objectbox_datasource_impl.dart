import 'package:dio/dio.dart';
import 'package:movie_app_clean_architecture/core/constants/home_page_constants/api_constants.dart';
import 'package:movie_app_clean_architecture/core/objectbox/movie_objectbox_store.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/data/datasource/objectbox_datasource.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/data/model/movie_model_entity.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'objectbox_datasource_impl.g.dart';

class ObjectBoxDatasourceImpl implements ObjectBoxDatasource {
  final box = MovieObjectBox.instance.movieBox;
  @override
  void addMovies(List<MovieModelEntity> entityModel) async {
    final dio = Dio(BaseOptions(baseUrl: ApiConstants.imagePath));
    final cacheDirectory =
        '${(await getApplicationCacheDirectory()).path}/cached_images';
    for (final movie in entityModel) {
      final posterPathLocation = '$cacheDirectory${movie.posterPath}';
      final backDropPathLocation = '$cacheDirectory${movie.backdropPath}';
      await dio.download(movie.posterPath!, posterPathLocation);
      await dio.download(movie.backdropPath!, backDropPathLocation);
      movie.posterPath = posterPathLocation;
      movie.backdropPath = backDropPathLocation;
    }
    box.putMany(entityModel);
  }

  @override
  void clearAll() {
    box.removeAll();
  }

  @override
  List<MovieModelEntity> getMovies() {
    return box.getAll();
  }
}

@riverpod
ObjectBoxDatasource objectBoxDatasource(ObjectBoxDatasourceRef ref) {
  return ObjectBoxDatasourceImpl();
}

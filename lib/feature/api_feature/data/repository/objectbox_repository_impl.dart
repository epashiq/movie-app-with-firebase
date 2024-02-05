import 'package:movie_app_clean_architecture/feature/api_feature/data/datasource/objectbox_datasource.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/data/datasource/objectbox_datasource_impl.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/data/model/movie_model_entity.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/domain/entity/api_movie_entity.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/domain/repository/objectbox_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'objectbox_repository_impl.g.dart';

class ObjectBoxRepositoryImpl implements ObjectBoxRepository {
  final ObjectBoxDatasource datasource;
  ObjectBoxRepositoryImpl({required this.datasource});
  @override
  void addMovies(List<ApiEntity> entity) {
    final List<MovieModelEntity> moviesAdd = [];
    for (final mov in entity) {
      final entityModel = MovieModelEntity(
          movieId: mov.id,
          posterPath: mov.posterPath,
          overview: mov.overview,
          backdropPath: mov.backdropPath,
          title: mov.title,
          originalTitle: mov.originalTitle,
          originalLanguage: mov.originalLanguage,
          releaseDate: mov.releaseDate,
          voteCount: mov.voteCount ?? 0);
      moviesAdd.add(entityModel);
    }
    datasource.addMovies(moviesAdd);
  }

  @override
  void clearAll() {
    datasource.clearAll();
  }

  @override
  List<ApiEntity> getMovies() {
    final data = datasource.getMovies();
    return [
      for (final model in data)
        ApiEntity(
          id: model.movieId ?? 0,
          title: model.title ?? '',
          originalTitle: model.originalTitle ?? '',
          originalLanguage: model.originalLanguage ?? '',
          overview: model.overview ?? '',
          posterPath: model.posterPath ?? '',
          releaseDate: model.releaseDate ?? DateTime.now(),
          backdropPath: model.backdropPath ?? '',
          voteCount: model.voteCount,
        )
    ];
  }
}

@riverpod
ObjectBoxRepository objectBoxRepository(ObjectBoxRepositoryRef ref) {
  return ObjectBoxRepositoryImpl(
      datasource: ref.watch(objectBoxDatasourceProvider));
}

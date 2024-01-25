import 'package:movie_app_clean_architecture/feature/api_feature/data/datasource/popular_movies_datasource.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/data/datasource/popular_movies_datasources_impl.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/domain/entity/api_movie_entity.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/domain/repository/popular_movie_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'popular_movies_repository_impl.g.dart';

class PopularMoviesRepositoryImpl implements PopularMoviesRepository {
  final PopularMoviesDatasource datasource;
  PopularMoviesRepositoryImpl({required this.datasource});

  @override
  Future<List<ApiEntity>> getMovies() async {
    final ds = await datasource.getMovies();

    late List<ApiEntity> results;

    results = [
      for (final result in ds.results)
        ApiEntity(
            posterPath: result.posterPath,
            title: result.title,
            originalTitle: result.originalTitle,
            originalLanguage: result.originalLanguage,
            overview: result.overview,
            releaseDate: result.releaseDate,
            backdropPath: result.backdropPath,
            voteAverage: result.voteAverage,
            voteCount: result.voteCount),
    ];
    return results;
  }
}
@riverpod
PopularMoviesRepository popularMoviesRepository(PopularMoviesRepositoryRef ref){
  return PopularMoviesRepositoryImpl(datasource: ref.watch(popularMoviesDatasourceProvider));
}

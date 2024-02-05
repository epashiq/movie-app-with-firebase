import 'package:movie_app_clean_architecture/feature/api_feature/data/datasource/api_service_datasource.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/data/datasource/api_service_datasource_impl.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/domain/entity/api_movie_entity.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/domain/repository/movie_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'movie_repository_impl.g.dart';

class ApiMovieRepositoryImpl implements ApiMovieRepository {
  final ApiServiceDataSource dataSource;
  ApiMovieRepositoryImpl({required this.dataSource});

  @override
  Future<List<ApiEntity>> fetchMovies() async {
    final ds = await dataSource.fetchMovies();

    late List<ApiEntity> results;

    results = [
      for (final result in ds.results)
        ApiEntity(
          id: result.id!,
          originalTitle: result.originalTitle,
          overview: result.overview ?? '',
          posterPath: result.posterPath ?? '',
          title: result.title ?? '',
          originalLanguage: result.originalLanguage,
          releaseDate: DateTime.tryParse(result.releaseDate ?? '') ?? DateTime.now(),
          backdropPath: result.backdropPath ?? '',
          // voteAverage: result.voteAverage,
          voteCount: result.voteCount,
        )
    ];
    return results;
  }

  @override
  Future<List<ApiEntity>> serachMovies(String text) async {
    final ds = await dataSource.serchMovies(text);
    late List<ApiEntity> results;
    results = [
      for (final result in ds.results)
        ApiEntity(
            id: result.id!,
            title: result.title ?? '',
            originalTitle: result.originalTitle,
            originalLanguage: result.originalLanguage,
            overview: result.overview ?? '',
            posterPath: result.posterPath ?? '',
            releaseDate: DateTime.tryParse(result.releaseDate ?? '') ?? DateTime.now(),
            backdropPath: result.backdropPath ?? '',
            voteCount: result.voteCount)
    ];
    return results;
  }
}

@riverpod
ApiMovieRepository movieRepository(MovieRepositoryRef ref) {
  return ApiMovieRepositoryImpl(
      dataSource: ref.watch(apiServiceDataSourceProvider));
}

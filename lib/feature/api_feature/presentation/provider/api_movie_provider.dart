import 'package:movie_app_clean_architecture/feature/api_feature/data/repository/movie_repository_impl.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/data/repository/popular_movies_repository_impl.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/domain/repository/movie_repository.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/domain/repository/popular_movie_repository.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/domain/usecase/get_movies_usecase.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/domain/usecase/popular_get_movies_usecase.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/presentation/provider/provider_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'api_movie_provider.g.dart';

@riverpod
class Movie extends _$Movie {
  @override
  Future<ProviderState> build() async {
    final ApiMovieRepository repository = ref.watch(movieRepositoryProvider);
    final PopularMoviesRepository repository2 =
        ref.watch(popularMoviesRepositoryProvider);
    final result = await Future.wait([
      GetMoviesUsecase(repository: repository)(),
      PopularMovieUsecase(repository: repository2)()
    ]);
    return ProviderState(movies: result[0], popular: result[1]);
  }
}

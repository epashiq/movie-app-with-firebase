import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/data/repository/firebase_comment_repository_impl.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/data/repository/firebase_repository_impl.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/data/repository/movie_repository_impl.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/data/repository/objectbox_repository_impl.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/data/repository/popular_movies_repository_impl.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/domain/entity/api_movie_entity.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/domain/entity/firebase_comment_entity.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/domain/repository/movie_repository.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/domain/repository/objectbox_repository.dart';
// import 'package:movie_app_clean_architecture/feature/api_feature/domain/repository/popular_movie_repository.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/domain/usecase/add_comment_usecase.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/domain/usecase/add_to_firestore_usecase.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/domain/usecase/check_movie_usecase.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/domain/usecase/delete_from_firestore_usecase.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/domain/usecase/get_all_movies_secase.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/domain/usecase/get_comment_usecase.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/domain/usecase/get_movies_usecase.dart';
// import 'package:movie_app_clean_architecture/feature/api_feature/domain/usecase/popular_get_movies_usecase.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/domain/usecase/search_movie_usecase.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/presentation/provider/provider_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'api_movie_provider.g.dart';

@riverpod
class Movie extends _$Movie {
  @override
  Future<ProviderState> build() async {
    final ApiMovieRepository repository = ref.watch(movieRepositoryProvider);
    final ObjectBoxRepository objRepository =
        ref.watch(objectBoxRepositoryProvider);
    // final PopularMoviesRepository repository2 =
    ref.watch(popularMoviesRepositoryProvider);
    final result = await Future.wait([
      GetMoviesUsecase(repository: repository, obRepository: objRepository)(),
      // PopularMovieUsecase(repository: repository2)()
    ]);

    final initialData = ProviderState(
        movies: result[0],
        // popular: result[1],
        favMovies: [],
        searchMovies: null,
        favMovieStream: getAllMovies().asBroadcastStream());

    return initialData;
  }

  Future<void> addToFireStore(ApiEntity entity) async {
    final repository = ref.watch(firebaseRepositoryProvider);
    await AddToFireStoreUsecase(repository: repository)(entity);
  }

  Future<void> deleteFromFirestore(int id) async {
    final repository = ref.watch(firebaseRepositoryProvider);
    await DeleteFromFirestoreUsecase(repository: repository)(id);
  }

  Stream<List<ApiEntity>> getAllMovies() async* {
    final repository = ref.watch(firebaseRepositoryProvider);
    await for (final favMovies
        in GetAllMoviesUsecase(repository: repository)()) {
      state = AsyncValue.data(state.value!.copyWith(favMovies: favMovies));
      yield favMovies;
    }
  }

  bool isFavourite(int movieId) {
    return CheckMovieUsecase()(movieId, state.value!.favMovies);
  }

  Future<void> searchMovies(String text) async {
    final repository = ref.watch(movieRepositoryProvider);
    final ds = await SearchMovieUsecase(repository: repository)(text);
    state = AsyncValue.data(state.value!.copyWith(searchMovies: ds));
  }

  Future<void> addComment(CommentEntity entity) async {
    final repository = ref.watch(firebaseCommentRepositoryProvider);
    await AddCommentUsecase(repository: repository)(entity);
  }

  Stream<List<CommentEntity>> getComment(String id) {
    final repository = ref.watch(firebaseCommentRepositoryProvider);
    return GetCommentUsecase(repository: repository)(id);
  }
}

final readmoreProvider = StateProvider<bool>((ref) {
  return false;
});

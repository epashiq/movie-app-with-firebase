import 'package:movie_app_clean_architecture/feature/api_feature/data/datasource/firebase_datasources.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/data/datasource/firebase_datasources_impl.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/data/model/firebase_model.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/domain/entity/api_movie_entity.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/domain/repository/firebase_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'firebase_repository_impl.g.dart';

class FirebaseRepositoryImpl implements FirebaseRepository {
  final FirebaseDataSource dataSource;
  FirebaseRepositoryImpl({required this.dataSource});
  @override
  Future<void> addToFireStore(ApiEntity entity) async {
    final model = FirebaseModel(
        id: entity.id,
        title: entity.title,
        originalTitle: entity.originalTitle,
        originalLanguage: entity.originalLanguage,
        overview: entity.overview,
        posterPath: entity.posterPath,
        releaseDate: entity.releaseDate,
        backdropPath: entity.backdropPath,
        // voteAverage: entity.voteAverage,
        voteCount: entity.voteCount);

    await dataSource.addToFireStore(model);
  }

  @override
  Future<void> deleteFromFirestore(int id) async {
    await dataSource.deleteFromFirestore(id);
  }

  @override
  Stream<List<ApiEntity>> getAllMovies() async* {
    final ds = dataSource.getAllMovies();
    await for (final doc in ds) {
      final docs = doc.docs;
      yield [
        for (final model in docs)
          ApiEntity(
              id: model.data().id,
              title: model.data().title,
              originalTitle: model.data().originalTitle,
              originalLanguage: model.data().originalLanguage,
              overview: model.data().overview,
              posterPath: model.data().posterPath,
              releaseDate: model.data().releaseDate,
              backdropPath: model.data().backdropPath,
              // voteAverage: model.data().voteAverage,
              voteCount: model.data().voteCount)
      ];
    }
  }
}

@riverpod
FirebaseRepository firebaseRepository(FirebaseRepositoryRef ref) {
  return FirebaseRepositoryImpl(
      dataSource: ref.watch(firebaseDataSourceProvider));
}

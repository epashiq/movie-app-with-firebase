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
        backdropPath: entity.backdropPath);
    await dataSource.addToFireStore(model);
  }

  @override
  Future<void> deleteFromFirestore(int id) async {
    await dataSource.deleteFromFirestore(id);
  }
}


@riverpod
FirebaseRepository firebaseRepository(FirebaseRepositoryRef ref){
  return FirebaseRepositoryImpl(dataSource: ref.watch(firebaseDataSourceProvider));
}

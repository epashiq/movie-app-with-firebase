import 'package:movie_app_clean_architecture/feature/api_feature/data/datasource/firebase_comment_datasource.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/data/datasource/firebase_comment_datasource_impl.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/data/model/firestore_comment_model.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/domain/entity/firebase_comment_entity.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/domain/repository/firebase_comment_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'firebase_comment_repository_impl.g.dart';

class FirebaseCommentRepositoryImpl implements FirebaseCommentRepository {
  final FirebaseCommentDataSource dataSource;
  FirebaseCommentRepositoryImpl({required this.dataSource});

  @override
  Future<void> addComment(CommentEntity entity) async {
    final model =
        FirestoreCommentModel(text: entity.text, movieId: entity.movieId);

    await dataSource.addComment(model);
  }

  @override
  Stream<List<CommentEntity>> getComment(String id) async* {
    final ds = dataSource.getcomments(id);
    await for (final da in ds) {
      final data = da.docs;
      yield [
        for (final i in data)
          CommentEntity(
              text: i.data().text, id: i.id, movieId: i.data().movieId)
      ];
    }
  }
}

@riverpod
FirebaseCommentRepository firebaseCommentRepository(
    FirebaseCommentRepositoryRef ref) {
  return FirebaseCommentRepositoryImpl(
      dataSource: ref.watch(firebaseCommentDataSourceProvider));
}

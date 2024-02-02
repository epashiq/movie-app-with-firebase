import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/data/datasource/firebase_comment_datasource.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/data/model/firestore_comment_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'firebase_comment_datasource_impl.g.dart';

class FirebaseCommentDataSourceImpl implements FirebaseCommentDataSource {
  final collection = FirebaseFirestore.instance
      .collection('comments')
      .withConverter(
          fromFirestore: FirestoreCommentModel.fromFirestore,
          toFirestore: (model, _) => model.toFirestore());

  @override
  Future<void> addComment(FirestoreCommentModel model) async {
    await collection.add(model);
  }

  @override
  Stream<QuerySnapshot<FirestoreCommentModel>> getcomments(String movieId) {
    return collection.where('movieId',isEqualTo: movieId).snapshots();
  }
}

@riverpod
FirebaseCommentDataSource firebaseCommentDataSource(
    FirebaseCommentDataSourceRef ref) {
  return FirebaseCommentDataSourceImpl();
}

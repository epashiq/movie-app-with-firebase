import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/data/model/firestore_comment_model.dart';

abstract class FirebaseCommentDataSource{
  Future<void>addComment(FirestoreCommentModel model, );
    Stream<QuerySnapshot<FirestoreCommentModel>> getcomments(String movieId);

}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'firestore_comment_model.g.dart';
part 'firestore_comment_model.freezed.dart';

@freezed
class FirestoreCommentModel with _$FirestoreCommentModel {
  const FirestoreCommentModel._();
  factory FirestoreCommentModel({
    // required String userName,
    required String text,
    // required DateTime time,
    required String movieId,
  }) = _FirestoreCommentModel;

  factory FirestoreCommentModel.fromJson(Map<String, dynamic> json) =>
      _$FirestoreCommentModelFromJson(json);

  factory FirestoreCommentModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) 
      {
    final data = snapshot.data()!;
    return FirestoreCommentModel.fromJson(data);
  }
  Map<String, dynamic> toFirestore() {
    return toJson();
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'firebase_model.freezed.dart';
part 'firebase_model.g.dart';

@freezed
class FirebaseModel with _$FirebaseModel {
  const FirebaseModel._();
  factory FirebaseModel({
    required int id,
    required String title,
    required String originalTitle,
    required String originalLanguage,
    required String overview,
    required String posterPath,
    required DateTime releaseDate,
    required String backdropPath,
  }) = _FirebaseModel;

   factory FirebaseModel.fromJson(Map<String, dynamic> json) =>
      _$FirebaseModelFromJson(json);
  factory FirebaseModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data()!;
    return FirebaseModel.fromJson(data);
  }
  Map<String, dynamic> toFirestore() {
    return toJson();
  }
}

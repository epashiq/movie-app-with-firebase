import 'package:freezed_annotation/freezed_annotation.dart';
part 'firebase_comment_entity.freezed.dart';
@freezed
class CommentEntity with _$CommentEntity{
  factory CommentEntity({
    // required String userName,
    required String text,
    // required DateTime time,
    required String id,
    required String movieId,
  }) = _CommentEntity;
}
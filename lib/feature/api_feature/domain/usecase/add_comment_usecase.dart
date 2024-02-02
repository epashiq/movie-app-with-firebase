import 'package:movie_app_clean_architecture/core/exeptions/base_exception.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/domain/entity/firebase_comment_entity.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/domain/repository/firebase_comment_repository.dart';

final class AddCommentUsecase {
  final FirebaseCommentRepository repository;
  AddCommentUsecase({required this.repository});

  Future<void> call(CommentEntity entity) async {
    try {
      await repository.addComment(entity);
    } catch (e) {
      throw BaseException(e.toString());
    }
  }
}

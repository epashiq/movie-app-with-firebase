import 'package:movie_app_clean_architecture/feature/api_feature/domain/entity/firebase_comment_entity.dart';

abstract class FirebaseCommentRepository{
 Future<void> addComment(CommentEntity entity);
 Stream<List<CommentEntity>>getComment(String id);

}
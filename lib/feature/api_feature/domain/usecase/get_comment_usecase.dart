import 'package:movie_app_clean_architecture/core/exeptions/base_exception.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/domain/entity/firebase_comment_entity.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/domain/repository/firebase_comment_repository.dart';

final class GetCommentUsecase{
  final FirebaseCommentRepository repository;
  GetCommentUsecase({required this.repository});
  Stream<List<CommentEntity>>call(String id){
    try{
     return repository.getComment(id);
    }catch (e){
      throw BaseException(e.toString());
    }
  }
}
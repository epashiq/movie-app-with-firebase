
import 'package:movie_app_clean_architecture/core/exeptions/base_exception.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/domain/entity/api_movie_entity.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/domain/repository/firebase_repository.dart';

final class AddToFireStoreUsecase{
  final FirebaseRepository repository;
  AddToFireStoreUsecase({required this.repository});
  Future<void>call(ApiEntity entity)async{
    try{
      await repository.addToFireStore(entity);
    }catch (e){
      throw BaseException(e.toString());
    }
  }
}
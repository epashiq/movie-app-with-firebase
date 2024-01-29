import 'package:movie_app_clean_architecture/core/exeptions/base_exception.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/domain/repository/firebase_repository.dart';

final class DeleteFromFirestoreUsecase{
  FirebaseRepository repository;
  DeleteFromFirestoreUsecase({required this.repository});
  Future<void>call(int id)async{
    try{
     await repository.deleteFromFirestore(id);
    }catch (e){
      throw BaseException(e.toString());
    }
  }
}
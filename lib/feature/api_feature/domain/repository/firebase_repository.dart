import 'package:movie_app_clean_architecture/feature/api_feature/domain/entity/api_movie_entity.dart';

abstract class FirebaseRepository {
  Future<void> addToFireStore(ApiEntity entity);
  Future<void> deleteFromFirestore(int id);
  Stream<List<ApiEntity>>getAllMovies();
  
}

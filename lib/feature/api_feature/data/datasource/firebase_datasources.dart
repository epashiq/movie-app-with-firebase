import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/data/model/firebase_model.dart';

abstract class FirebaseDataSource {
  Future<void> addToFireStore(FirebaseModel model);
  Future<void> deleteFromFirestore(int id);
  Stream<QuerySnapshot<FirebaseModel>> getAllMovies( );
}

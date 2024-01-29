import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/data/datasource/firebase_datasources.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/data/model/firebase_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'firebase_datasources_impl.g.dart';

class FirebaseDataSourceImpl implements FirebaseDataSource {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> addToFireStore(FirebaseModel model) async {
    final collection = firestore.collection('Favourite_movies');
    await collection.doc(model.id.toString()).set(model.toFirestore());
  }

  @override
  Future<void> deleteFromFirestore(int id) async {
    await firestore.collection('Favourite_movies').doc(id.toString()).delete();
  }
}

@riverpod
FirebaseDataSource firebaseDataSource(FirebaseDataSourceRef ref) {
  return FirebaseDataSourceImpl();
}

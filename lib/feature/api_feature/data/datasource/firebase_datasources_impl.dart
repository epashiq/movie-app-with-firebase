import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/data/datasource/firebase_datasources.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/data/model/firebase_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'firebase_datasources_impl.g.dart';

class FirebaseDataSourceImpl implements FirebaseDataSource {
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final collection = firestore.collection('Favourite_movies').withConverter(
      fromFirestore: FirebaseModel.fromFirestore,
      toFirestore: (model, _) => model.toFirestore());

  @override
  Future<void> addToFireStore(FirebaseModel model) async {
    await collection.doc(model.id.toString()).set(model);
  }

  @override
  Future<void> deleteFromFirestore(int id) async {
    await firestore.collection('Favourite_movies').doc(id.toString()).delete();
  }

  @override
  Stream<QuerySnapshot<FirebaseModel>> getAllMovies() {
    return collection.snapshots();
  }
}

@riverpod
FirebaseDataSource firebaseDataSource(FirebaseDataSourceRef ref) {
  return FirebaseDataSourceImpl();
}

import 'package:movie_app_clean_architecture/feature/api_feature/data/model/trailer_model.dart';

abstract class TrailerDataSource{
  Future<TrailerModel>getTrailer(String id);
}
import 'package:movie_app_clean_architecture/feature/api_feature/domain/entity/trailer_entity.dart';

abstract class TrailerRepository {
  Future<List<TrailerEntity>> getTrailer(String id);
}

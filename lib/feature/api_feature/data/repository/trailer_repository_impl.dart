import 'package:movie_app_clean_architecture/feature/api_feature/data/datasource/trailer_datasource.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/data/datasource/trailer_datasource_impl.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/domain/entity/trailer_entity.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/domain/repository/trailer_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'trailer_repository_impl.g.dart';

class TrailerRepositoryImpl implements TrailerRepository {
  final TrailerDataSource dataSource;
  TrailerRepositoryImpl({required this.dataSource});

  @override
  Future<List<TrailerEntity>> getTrailer(String id) async {
    final data = await dataSource.getTrailer(id);
    late List<TrailerEntity> results;

    results = [
      for (final model in data.results)
        TrailerEntity(type: model.type, name: model.name, key: model.key)
    ];
    return results;
  }
}

@riverpod
TrailerRepository trailerRepository(TrailerRepositoryRef ref) {
  return TrailerRepositoryImpl(
      dataSource: ref.watch(trailerDataSourceProvider));
}

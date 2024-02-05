
import 'package:movie_app_clean_architecture/feature/api_feature/data/repository/trailer_repository_impl.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/domain/entity/trailer_entity.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/domain/usecase/trailer_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'trailer_provider.g.dart';
@riverpod
Future<List<TrailerEntity>>trailer(TrailerRef ref , String movieId)async{
  return await TrailerUsecase(repository: ref.watch(trailerRepositoryProvider))(movieId);
}
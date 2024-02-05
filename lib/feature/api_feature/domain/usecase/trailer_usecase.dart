import 'package:dio/dio.dart';
import 'package:movie_app_clean_architecture/core/exeptions/base_exception.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/domain/entity/trailer_entity.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/domain/repository/trailer_repository.dart';

final class TrailerUsecase {
  final TrailerRepository repository;
  TrailerUsecase({required this.repository});

  Future<List<TrailerEntity>> call(String id) async {
    try {
      final videos = await repository.getTrailer(id);
      final trailors = videos
          .where((video) => video.type.toLowerCase().trim() == 'trailer')
          .toList();
      return trailors;
    } catch (e) {
      throw BaseException(
          'errror while loading \n ${(e is DioException) ? e.type : e}');
    }
  }
}

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'api_movie_entity.freezed.dart';

@freezed
class ApiEntity with _$ApiEntity {
  const factory ApiEntity(
      {required int id,
      required String title,
      required String originalTitle,
      required String originalLanguage,
      required String overview,
      required String posterPath,
      required DateTime releaseDate,
      required String backdropPath,
      required double voteAverage,
      required int? voteCount,
      }) = _ApiEntity;
}

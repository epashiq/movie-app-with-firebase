// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'api_movie_entity.freezed.dart';

@freezed
class ApiEntity with _$ApiEntity{
  const factory ApiEntity({
     @JsonKey(name: "title") required String title,
     @JsonKey(name: "original_title") required String originalTitle,
     @JsonKey(name: "original_language") required String originalLanguage,
     @JsonKey(name: "overview") required String overview,
     @JsonKey(name: "poster_path") required String posterPath 
  }) = _ApiEntity;

}
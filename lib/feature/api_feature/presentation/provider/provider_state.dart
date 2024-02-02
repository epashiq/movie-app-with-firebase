import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app_clean_architecture/feature/api_feature/domain/entity/api_movie_entity.dart';
part 'provider_state.freezed.dart';
@freezed
class ProviderState with _$ProviderState{
  factory ProviderState({
    required List<ApiEntity> movies,
    required List<ApiEntity>popular,
    required Stream<List<ApiEntity>>favMovieStream,
    required List<ApiEntity>favMovies,
    required List<ApiEntity>? searchMovies
  }) = _ProviderState;
}
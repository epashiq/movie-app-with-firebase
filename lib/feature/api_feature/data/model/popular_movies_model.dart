// To parse this JSON data, do
//
//     final popularMoviesModel = popularMoviesModelFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'popular_movies_model.freezed.dart';
part 'popular_movies_model.g.dart';

PopularMoviesModel popularMoviesModelFromJson(String str) => PopularMoviesModel.fromJson(json.decode(str));

String popularMoviesModelToJson(PopularMoviesModel data) => json.encode(data.toJson());

@freezed
class PopularMoviesModel with _$PopularMoviesModel {
    const factory PopularMoviesModel({
        @JsonKey(name: "dates")
        required Dates dates,
        @JsonKey(name: "page")
        required int page,
        @JsonKey(name: "results")
        required List<Result> results,
        @JsonKey(name: "total_pages")
        required int totalPages,
        @JsonKey(name: "total_results")
        required int totalResults,
    }) = _PopularMoviesModel;

    factory PopularMoviesModel.fromJson(Map<String, dynamic> json) => _$PopularMoviesModelFromJson(json);
}

@freezed
class Dates with _$Dates {
    const factory Dates({
        @JsonKey(name: "maximum")
        required DateTime maximum,
        @JsonKey(name: "minimum")
        required DateTime minimum,
    }) = _Dates;

    factory Dates.fromJson(Map<String, dynamic> json) => _$DatesFromJson(json);
}

@freezed
class Result with _$Result {
    const factory Result({
        @JsonKey(name: "adult")
        required bool adult,
        @JsonKey(name: "backdrop_path")
        required String backdropPath,
        @JsonKey(name: "genre_ids")
        required List<int> genreIds,
        @JsonKey(name: "id")
        required int id,
        @JsonKey(name: "original_language")
        required String originalLanguage,
        @JsonKey(name: "original_title")
        required String originalTitle,
        @JsonKey(name: "overview")
        required String overview,
        @JsonKey(name: "popularity")
        required double popularity,
        @JsonKey(name: "poster_path")
        required String posterPath,
        @JsonKey(name: "release_date")
        required DateTime releaseDate,
        @JsonKey(name: "title")
        required String title,
        @JsonKey(name: "video")
        required bool video,
        @JsonKey(name: "vote_average")
        required double voteAverage,
        @JsonKey(name: "vote_count")
        required int voteCount,
    }) = _Result;

    factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}

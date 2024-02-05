import 'package:objectbox/objectbox.dart';


@Entity()
class MovieModelEntity {
  @Id()
  int id = 0;

  int? movieId;
  String? posterPath;
  String? overview;
  String? backdropPath;
  String? title;
  String? originalTitle;
  String? originalLanguage;
  DateTime? releaseDate;
  int? voteCount;

  MovieModelEntity(
      {required this.movieId,
      required this.posterPath,
      required this.overview,
      required this.backdropPath,
      required this.title,
      required this.originalTitle,
      required this.originalLanguage,
      required this.releaseDate,
      required this.voteCount});
}

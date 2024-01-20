// import 'package:movie_app_clean_architecture/feature/api_feature/data/datasource/api_service_datasource.dart';
// import 'package:movie_app_clean_architecture/feature/api_feature/data/model/movie_api_model.dart';
// import 'package:movie_app_clean_architecture/feature/api_feature/domain/entity/api_movie_entity.dart';
// import 'package:movie_app_clean_architecture/feature/api_feature/domain/repository/movie_repository.dart';

// class ApiMovieRepositoryImpl implements ApiMovieRepository{
//   final ApiServiceDataSource dataSource;
//   ApiMovieRepositoryImpl({required this.dataSource});

//   @override
//   Future<List<ApiEntity>> fetchMovies() async{
//     final ds= await dataSource.fetchMovies();
//   }

//   late List<ApiEntity> results;
//   results = [
//     for(final result in ds.results)
//   ]
// }
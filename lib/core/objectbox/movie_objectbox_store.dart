import 'package:movie_app_clean_architecture/feature/api_feature/data/model/movie_model_entity.dart';
import 'package:movie_app_clean_architecture/objectbox.g.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class MovieObjectBox{
  static MovieObjectBox? _instance;
  
  final Store store;
  late final Box<MovieModelEntity>movieBox;

  MovieObjectBox._create(this.store){
    movieBox = store.box<MovieModelEntity>();
  }

  static MovieObjectBox get instance{
    return _instance!;
  }

  static Future<void>create()async{
    if(_instance == null){
      final docsDir =await getApplicationCacheDirectory();
      final store = await openStore(directory:join(docsDir.path , 'movie'));
      _instance = MovieObjectBox._create(store);
    }
  }
}
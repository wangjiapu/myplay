import '../beans/HotMovieIfo.dart';
import '../beans/MovieInfo.dart';
import '../beans/PlayInfo.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (T.toString() == "HotMovieInfo") {
      return HotMovieInfo.fromJson(json) as T;
    } else if (T.toString() == "MovieInfo") {
      return MovieInfo.fromJson(json) as T;
    } else if (T.toString() == "PlayInfo") {
      return PlayInfo.fromJson(json) as T;
    }
  }
}

import 'package:myplay/beans/MovieInfo.dart';
import 'package:myplay/httputils/api.dart';
import 'package:rxdart/rxdart.dart';


class RequestMap{
  /**
   * 请求热门电影
   *
   */

  static final String URL="www.123.com";

  static PublishSubject<MovieInfoEntry> requestHotMovie<BaseResponse>(){

    return HttpManager().get<MovieInfoEntry>(URL);
  }

}

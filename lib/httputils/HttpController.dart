import 'package:rxdart/rxdart.dart';

import 'httputils/api.dart';
import 'beans/MovieInfo.dart';


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

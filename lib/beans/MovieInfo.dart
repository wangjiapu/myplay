

class MovieInfo{
  //剧目名称
  String name;
  //电影类型
  String type;
  //时长
  String duration;
  //简介
  String describe;
  //产地
  String from;
  //上映年份
  String time;
  //电影评分
  String score;
  MovieInfo(
      {this.name,this.type,this.duration,this.describe,
        this.from,this.time,this.score});

  MovieInfo.fromJson(Map<String,dynamic> json){

  }
  MovieInfo.toJson(){

  }
}


class MovieInfoEntry{
  bool error;
  List<MovieInfo> movies;
  MovieInfoEntry({this.error,this.movies});
  MovieInfoEntry.fromJson(Map<String,dynamic> json){
    error = json['error'];
    if (json['results'] != null) {
      movies = new List<MovieInfo>();
      (json['results'] as List).forEach((v) {
        movies.add(new MovieInfo.fromJson(v));
      });
    }
  }

  MovieInfoEntry.toJson(){

  }
}

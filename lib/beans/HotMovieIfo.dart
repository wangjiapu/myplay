class HotMovieInfo {
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

  HotMovieInfo(
      {this.name,
      this.type,
      this.duration,
      this.describe,
      this.from,
      this.time,
      this.score});

  HotMovieInfo.fromJson(Map<String, dynamic> json) {}

  HotMovieInfo.toJson() {}
}

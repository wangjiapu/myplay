import 'package:flutter/material.dart';
import 'package:myplay/beans/HotPlayInfo.dart';

class PlayInfoWidget extends StatefulWidget {
  final HotPlayInfo mPlayInfo;

  PlayInfoWidget({Key key, this.mPlayInfo}) : super(key: key);

  @override
  _PlayInfoWidget createState() => _PlayInfoWidget();
}

class _PlayInfoWidget extends State<PlayInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.all(20.0),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            widget.mPlayInfo.name,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 17.0,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.0),
          ),
          _makeStars(widget.mPlayInfo.score),
          Padding(
            padding: EdgeInsets.only(top: 8.0),
          ),
          _makeOtherInfo(widget.mPlayInfo.productionFrom,
              widget.mPlayInfo.productionTime, widget.mPlayInfo.type),
          Padding(
            padding: EdgeInsets.only(top: 5.0),
          ),
          //
          Text(
            "简介",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 17.0,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 12.0),
          ),
          Text(
            widget.mPlayInfo.introduction,
            style: TextStyle(
              color: Colors.black,
              fontSize: 15.0,
            ),
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.0),
          ),
          _makeEpisode(widget.mPlayInfo.isPlay),
        ],
      ),
    );
  }

  _makeEpisode(String isPlay) {
    if (isPlay == "电视剧") {
      return new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("剧集"),
          Padding(
            padding: EdgeInsets.only(top: 20.0),
          ),
          _PlayListViewWidget(),
        ],
      );
    } else {
      return new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("pppp"),
          Padding(
            padding: EdgeInsets.only(top: 20.0),
          ),
        ],
      );
    }
  }

  _makeOtherInfo(String from, String time, String type) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          from,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16.0,
          ),
        ),
        Padding(padding: EdgeInsets.only(left: 8.0)),
        Text(
          time,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16.0,
          ),
        ),
        Padding(padding: EdgeInsets.only(left: 8.0)),
        Text(
          type,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16.0,
          ),
        ),
      ],
    );
  }

  _makeStars(double score) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        _getStars(1, score),
        Padding(
          padding: EdgeInsets.only(left: 2.0),
        ),
        _getStars(2, score),
        Padding(
          padding: EdgeInsets.only(left: 2.0),
        ),
        _getStars(3, score),
        Padding(
          padding: EdgeInsets.only(left: 2.0),
        ),
        _getStars(4, score),
        Padding(
          padding: EdgeInsets.only(left: 2.0),
        ),
        _getStars(5, score),
        Padding(
          padding: EdgeInsets.only(left: 10.0),
        ),
        Text(
          "${widget.mPlayInfo.score}",
          style: TextStyle(
            fontSize: 20.0,
            color: Color(0xFFFF5722),
          ),
        )
      ],
    );
  }

  _getStars(int n, double s) {
    int temp = (s ~/ 2).toInt();
    if (temp >= n) {
      return Icon(
        Icons.star,
        size: 16.0,
        color: Color(0xFFFF5722),
      );
    } else {
      return Icon(
        Icons.star,
        size: 16.0,
        color: Colors.grey,
      );
    }
  }
}

/*
   电视剧、电影  播放列表
 */
class _PlayListViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _PlayItemWidget();
  }
}

class _PlayItemWidget extends StatelessWidget {
  final List<String> mlist = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10"
  ];
  List<Widget> listItem = [];

  _getPlayItem() {
    for (String s in mlist) {
      listItem.add(new Container(
        width: 60.0,
        child: Card(
          child: Center(
            child: GestureDetector(
              onTap: () {
                print(s);
              },
              child:Text(s),
            ),
          ),
        ),
      ));
    }
    return listItem;
  }

  @override
  Widget build(BuildContext context) {
    return _makeCard(context);
  }

  _makeCard(BuildContext context) {
    return Container(
      //margin: EdgeInsets.symmetric(vertical: 12.0),
      height: 50.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: _getPlayItem(),
      ),
    );
  }
}

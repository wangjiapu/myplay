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
    // TODO: implement build
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
              fontSize: 16.0,
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
              widget.mPlayInfo.productionTime,widget.mPlayInfo.type),
          Padding(
            padding: EdgeInsets.only(top: 5.0),
          ),
          Text(
            "简介",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }

  _makeOtherInfo(String from,String time,String type){
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
          Padding(padding: EdgeInsets.only(left:8.0)),
          Text(
            time,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16.0,
            ),
          ),
          Padding(padding: EdgeInsets.only(left:8.0)),
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

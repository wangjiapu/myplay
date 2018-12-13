import 'package:flutter/material.dart';
import 'package:myplay/beans/HotPlayInfo.dart';


class PlayInfoWidget extends StatefulWidget {
  final HotPlayInfo mPlayInfo;
  PlayInfoWidget({@required this.mPlayInfo});
  @override
  _PlayInfoWidget createState() => _PlayInfoWidget(mPlayInfo: mPlayInfo);
}

class _PlayInfoWidget extends State<PlayInfoWidget> {
  final HotPlayInfo mPlayInfo;
  _PlayInfoWidget({@required this.mPlayInfo});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(padding: EdgeInsets.only(top: 10.0),),
        new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(padding: EdgeInsets.only(left: 30.0),),
            Text(
              "胖子行动队",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
              ),
            )
          ],
        ),

      ],
    );
  }
}

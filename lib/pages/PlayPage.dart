import 'package:flutter/material.dart';
import 'package:myplay/beans/HotPlayInfo.dart';
import 'package:myplay/widgets/AppBarWidget.dart';
import 'package:myplay/widgets/PlayImageWidget.dart';

class PlayPage extends StatefulWidget {
  final HotPlayInfo mPlayInfo;

  PlayPage({@required this.mPlayInfo});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PlayPage(mPlay: mPlayInfo);
  }
}

class _PlayPage extends State<PlayPage> {
  final HotPlayInfo mPlay;

  _PlayPage({@required this.mPlay});

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "",
      home: new Scaffold(
        body: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            PlayImageWidget(),
            Text("播放列表："),
          ],
        ),
      ),
    );
  }
}

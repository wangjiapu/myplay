import 'package:flutter/material.dart';
import 'package:myplay/beans/HotPlayInfo.dart';
import 'package:myplay/widgets/PlayInfoWidget.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:video_player/video_player.dart';

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
  VideoPlayerController beeController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
            _makePlayImage(),
            PlayInfoWidget(
              mPlayInfo: new HotPlayInfo("胖子行动队", "高清", "7亿", "8.7"),
            ),
          ],
        ),
      ),
    );
  }

  _makePlayImage() {
    return new Stack(
      children: <Widget>[
        new Center(
          child: new FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: "https://img0.pconline.com.cn/pconline/1405/30/"
                  "4844106_img_0232_thumb.jpg"),
        ),
        Positioned(
          top: 20.0,
          left: 14.0,
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
              // print("关闭");
            },
            icon: Icon(
              Icons.close,
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          bottom: 5.0,
          left: 14.0,
          right: 14.0,
          child: _playOperation(),
        ),
        // new Padding(padding: EdgeInsets.all(20.0)),
        // makeFloatingLayer(),
      ],
    );
  }

  _playOperation() {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        IconButton(
          onPressed: () {
            // print("关闭");
          },
          icon: Icon(
            Icons.play_arrow,
            color: Colors.white,
          ),
        ),
        Expanded(
          child: LinearProgressIndicator(
            backgroundColor: Colors.white12,
            valueColor: AlwaysStoppedAnimation(Colors.white30),
            value: 0.5,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 5.0),
        ),
        Text(
          "50/100",
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.0,
          ),
        ),
        IconButton(
          onPressed: () {
            // print("关闭");
          },
          icon: Icon(
            Icons.fullscreen,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}

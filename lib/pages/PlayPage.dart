import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myplay/beans/HotPlayInfo.dart';
import 'package:myplay/widgets/PlayInfoWidget.dart';
import 'package:transparent_image/transparent_image.dart';

import 'package:video_player/video_player.dart';

class PlayPage extends StatefulWidget {
  final HotPlayInfo mPlayInfo;

  PlayPage({this.mPlayInfo});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PlayPage(mPlay: mPlayInfo);
  }
}

class _PlayPage extends State<PlayPage> {
  final VideoPlayerController mPlayController = VideoPlayerController.network(
      "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4");
  bool isPlaying = false;
  final Completer<void> connectedCompleter = Completer<void>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future<void> initController(VideoPlayerController controller) async {
      controller.setLooping(true);
      controller.setVolume(0.0);
      controller.play();
      await connectedCompleter.future;
      await controller.initialize();
      if (mounted) setState(() {});

      initController(mPlayController);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    mPlayController.dispose();
    super.dispose();
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
              mPlayInfo: new HotPlayInfo("胖子行动队", "高清", "7亿", 8.7),
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
          child: MyVideo(
            controller: mPlayController,
          ),
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
            onPressed: () {},
            icon: Icon(
              Icons.play_arrow,
              color: Colors.white,
            )),
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

class MyVideo extends StatelessWidget {
  final VideoPlayerController controller;

  const MyVideo({Key key, this.controller}) : super(key: key);

  Widget _buildInlineVideo() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
      child: Center(
        child: AspectRatio(
          aspectRatio: 3 / 2,
          child: Hero(
            tag: controller,
            child: VideoPlayerLoading(controller),
          ),
        ),
      ),
    );
  }

  @override
  build(BuildContext context) {
   /* Widget fullScreenRoutePageBuilder(BuildContext context,
        Animation<double> animation, Animation<double> secondaryAnimation) {
      return _buildFullScreenVideo();
    }*/

   return SafeArea(
     top: false,
     bottom: false,
     child: Card(
       child: Column(
         children: <Widget>[
           GestureDetector(
            // onTap: pushFullScreenWidget,
             child: _buildInlineVideo(),
           ),
         ],
       ),
     ),
   );
  }


}

class VideoPlayerLoading extends StatefulWidget {
  const VideoPlayerLoading(this.controller);

  final VideoPlayerController controller;

  @override
  _VideoPlayerLoadingState createState() => _VideoPlayerLoadingState();
}

class _VideoPlayerLoadingState extends State<VideoPlayerLoading> {
  bool _initialized;

  @override
  void initState() {
    super.initState();
    _initialized = widget.controller.value.initialized;
    widget.controller.addListener(() {
      if (!mounted) {
        return;
      }
      final bool controllerInitialized = widget.controller.value.initialized;
      if (_initialized != controllerInitialized) {
        setState(() {
          _initialized = controllerInitialized;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_initialized) {
      return VideoPlayer(widget.controller);
    }
    return Stack(
      children: <Widget>[
        VideoPlayer(widget.controller),
        const Center(child: CircularProgressIndicator()),
      ],
      fit: StackFit.expand,
    );
  }
}
import 'package:flutter/material.dart';
import 'package:myplay/widgets/HotListViewWidget.dart';
import 'package:myplay/widgets/SearchHomeWidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        canvasColor: Color(0xffffffff),
      ),
      home: new Scaffold(
        backgroundColor: Colors.white,
        body: _Homepage(),
      ),
    );
  }
}

class _Homepage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageBuilder();
  }
}

class _HomePageBuilder extends State<_Homepage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new Padding(padding: EdgeInsets.fromLTRB(0.0, 56.0, 0.0, 0.0)),
          new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              new Icon(Icons.all_inclusive),
              new Container(
                width: 45.0,
              )
            ],
          ),
          Padding(padding: EdgeInsets.fromLTRB(0.0, 35.0, 0.0, 0.0)),
          _getImageIcon(),//设置图标
         SearchHomeWidget(),//查找widget
          HotListViewWidget(),//热门电影
          _getBottomWidget(),//底部导航栏
        ],
      ),
    );
  }

  _getBottomWidget() {
    return new BottomNavigationBar(
      currentIndex: 0,
      iconSize: 25.0,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.whatshot),
          title: new Text(
            "热门",
            style: TextStyle(fontSize: 0.0),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.keyboard_voice),
          title: new Text(
            "语音",
            style: TextStyle(fontSize: 0.0),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu),
          title: new Text(
            "更多",
            style: TextStyle(fontSize: 0.0),
          ),
        ),
      ],
      onTap: (index) {
        switch (index) {
          case 0:
            print("热门");
            break;
          case 1:
            print("语音");
            break;
          case 2:
            print("更多");
            break;
        }
      },
    );
  }

  _getImageIcon() {
    //获取图标
    return new Container(
      width: 100.0,
      child: Image.asset("lib/assets/ic_launcher.png"),
    );
  }
}

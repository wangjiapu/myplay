import 'package:flutter/material.dart';
import 'package:myplay/beans/HotPlayInfo.dart';
import 'package:myplay/pages/PlayPage.dart';

class HotListViewItemWidget extends StatelessWidget {
  final HotPlayInfo mPlayInfo;

  HotListViewItemWidget({Key key,this.mPlayInfo}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return _makeCard(context);
  }

  _makeCard(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 40.0,top: 0.0,right: 40.0,bottom: 0.0),
      child: new Card(
        child: new FlatButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(//跳转到播放界面
                  builder: (context) => new PlayPage(mPlayInfo: mPlayInfo,),
                ),
              );
            },
            child: new Padding(
                padding: new EdgeInsets.all(10.0),
                child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _getClarity(mPlayInfo.name+mPlayInfo.clarity),
                    new Padding(padding: EdgeInsets.only(left: 30.0,top: 5.0,
                        right: 30.0,bottom: 5.0)),
                    _getPlayCount(mPlayInfo.count),
                  ],
                )
            )),
      ),
    );

  }

  _getClarity(String clarity){
    return new Container(
      child: Text(
        clarity,
        style: TextStyle(
          color: Colors.grey,
          fontSize: 14.0,
        ),
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  _getPlayCount(String count){
    return new Expanded(
        flex:1,
        child: Center(
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.star,
                size: 16.0,
                color: Colors.blueGrey,
              ),
              Padding(padding: EdgeInsets.only(left: 5.0)),
              Text(
                count,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14.0,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ));
  }
}

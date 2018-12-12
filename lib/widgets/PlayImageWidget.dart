
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class PlayImageWidget extends StatefulWidget{
  @override
  _PlayImageWidget createState() => _PlayImageWidget();
}

class _PlayImageWidget extends State<PlayImageWidget>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Stack(
      children: <Widget>[
        new Center(
          child: new FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image:
              "http://yule.chinaxiaokang.com/uploads/image/20170924/1506242392337435.jpg"),
        ),
       // new Padding(padding: EdgeInsets.all(20.0)),
        makeFloatingLayer(),
      ],
    );
  }

  makeFloatingLayer(){
    return new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      //crossAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(padding: EdgeInsets.only(left:20.0,top: 26.0,right: 0.0,bottom: 0.0)),
        new Stack(
          children: <Widget>[
            Icon(Icons.close),

          ],
          //new Icon(Icons.add),
        )
      ],
    );
  }
}
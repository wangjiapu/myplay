import 'package:flutter/material.dart';

class SearchHomeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SearchHomeWidget();
  }
}

class _SearchHomeWidget extends State<SearchHomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 40.0, top: 30.0, right: 40.0, bottom: 0.0),
      child: new GestureDetector(
        onTap: (){
          print("点解了搜索按钮");
        },
        child: Container(
          child: _getTextSearch(),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.blueGrey,
              width: 1.5,
              style: BorderStyle.solid,
            ),
            borderRadius: new BorderRadius.all(new Radius.circular(10.0)),


          ),
        ),
      ),
    );
  }

  _getTextSearch() {
    return Row(
      children: <Widget>[
        Padding(
          padding:
              EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0, bottom: 20.0),
        ),
        Text(
          "输入准确的电影名",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16.0,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 88.0),
        ),
        Icon(
          Icons.search,
          size: 26.0,
          color: Colors.grey,
        )
      ],
    );
  }
}

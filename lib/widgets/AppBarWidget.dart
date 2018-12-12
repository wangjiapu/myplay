import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new AppBar(//elevation: 0.0,去掉影音
      title: new Text(
        "Flutter",
        style: TextStyle(
          fontSize: 16.0,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      leading: IconButton(
          icon: Icon(
            Icons.close,
          ),
          onPressed: () {
            //Navigator.pop(context);
          }),);
  }
}
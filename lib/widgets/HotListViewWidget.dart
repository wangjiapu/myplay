import 'package:flutter/material.dart';
import 'HotListViewItemWidget.dart';
import 'package:myplay/beans/HotPlayInfo.dart';

class HotListViewWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListView();
  }
  
}

class _ListView extends State<HotListViewWidget> {
  static const int MAX_ITEM_NUM=5;
  List<HotPlayInfo> items;

  _ListView(){
    items=new List.generate(10, (i) => HotPlayInfo("胖子行动队","(高清)", 500, i));
  }

  @override
  Widget build(BuildContext context) {
    return new Expanded(
        child: new ListView.builder(
      itemBuilder: (context, index) {
        return new HotListViewItemWidget(mplayinfo:items[index]);
      },
      itemCount: MAX_ITEM_NUM,
    ));
  }
}

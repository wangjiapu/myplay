import 'package:flutter/material.dart';
import 'HotListViewItemWidget.dart';
import 'package:myplay/beans/HotPlayInfo.dart';

const int MAX_ITEM_NUM = 5;

class HotListViewWidget extends StatelessWidget {
  final List<HotPlayInfo> items =
      new List.generate(10, (i) => HotPlayInfo("胖子行动队", "(高清)", "7亿", "7.8"));

  @override
  Widget build(BuildContext context) {
    return new Expanded(
        child: new ListView.builder(
      itemBuilder: (context, index) {
        return new HotListViewItemWidget(mPlayInfo: items[index]);
      },
      itemCount: MAX_ITEM_NUM,
    ));
  }
}

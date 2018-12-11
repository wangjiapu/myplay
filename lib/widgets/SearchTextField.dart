import 'package:flutter/material.dart';

class SearchTextField extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SearchTextField();
  }
}

class _SearchTextField extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 40.0, top: 30.0, right: 40.0, bottom: 0.0),
      child: TextField(
        cursorColor: Colors.grey,
        controller: TextEditingController(),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left:20.0,top: 10.0,right: 30.0,bottom: 10.0),
          border: OutlineInputBorder(
             // prefixIcon:Icon(Icons.search),
            borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
            borderSide: new BorderSide(
              style: BorderStyle.solid,
              color: Colors.grey,
              width: 30.0,
            ),
          ),
          hintText: "输入准确的电影名",
          suffixIcon: Icon(Icons.search),
        ),
        maxLines: 1,
        //最大行数
        autocorrect: true,
        autofocus: false,
        //是否自动更正
        onChanged: (text) {
          //内容改变的回调
          print('change $text');
        },
        onSubmitted: (text) {
          //内容提交(按回车)的回调
          print('submit $text');
        },
      ),
    );
  }
}

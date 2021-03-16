// import 'dart:html';

import 'package:flutter/material.dart';
//import 'package:cached_network_image/cached_network_image.dart';

class CustomControllerWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CustomControllerState();
  }
}

class _CustomControllerState extends State {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center, //设置主轴对齐方式
      crossAxisAlignment: CrossAxisAlignment.end, //设置纵轴对齐方式
      children: <Widget>[
        Container(
          color: Colors.yellow,
          width: 60,
          height: 60,
        ),
        Container(
          color: Colors.red,
          width: 60,
          height: 80,
          margin: EdgeInsets.all(10), //设置边距
        ),
        Container(
          color: Colors.green,
          width: 60,
          height: 60,
        ),
        Container(
          color: Colors.pink,
          width: 60,
          height: 80,
          margin: EdgeInsets.all(10), //设置边距
        )
      ],
    );
  }
}

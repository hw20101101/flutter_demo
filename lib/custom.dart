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
    return Column(
      children: <Widget>[
        Container(
          color: Colors.green,
          width: 60,
          height: 80,
        ),
        Container(
          color: Colors.purple,
          width: 80,
          height: 80,
        ),
        Container(
          color: Colors.yellow,
          width: 60,
          height: 80,
          margin: EdgeInsets.all(10),
        ),
        Container(
          color: Colors.red,
          width: 80,
          height: 80,
        ),
        Expanded(
          child: Container(
            color: Colors.yellowAccent,
            width: 80,
            height: 80,
          ),
          flex: 1, // 因为设置了 flex=1，所以宽度由 Expanded 来分配
        )
      ],
    );
  }
}

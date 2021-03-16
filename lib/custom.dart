import 'package:flutter/material.dart';

// Demo 中的第4个 TabController
class CustomControllerWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CustomControllerState();
  }
}

class _CustomControllerState extends State {
  @override
  Widget build(BuildContext context) {
    return Stack(
      //层叠容器
      children: <Widget>[
        Container(
          // 红色背景
          color: Colors.red,
          width: 300,
          height: 120,
        ),
        Positioned(
            // 叠加在红色容器之上的黄色背景
            left: 18,
            top: 25,
            child: Container(
              color: Colors.yellow,
              width: 60,
              height: 60,
            )),
        Positioned(
          // 叠加在黄色容器之上的文本
          child: Text('stack 提供了层叠布局的容器'),
          left: 18,
          top: 90,
        )
      ],
    );
  }
}

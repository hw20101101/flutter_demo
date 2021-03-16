import 'package:flutter/material.dart';
import 'AppUpdateItemModel.dart';

// App Store 升级 Item UI
class AppUpdateItemWidth extends StatelessWidget {
  final UpdateItemModel model;
  final VoidCallback onPressed2;
  AppUpdateItemWidth({Key key, this.model, this.onPressed2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        buildTopRow(context), //上半部分
        buildBottomRow(context) //下半部分
      ],
    );
  }

  //配置上半部分 UI
  Widget buildTopRow(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Image.asset(
              model.appIcon,
              width: 60,
              height: 60,
            ),
          ),
        ),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center, //垂直方向居中对齐
          crossAxisAlignment: CrossAxisAlignment.start, //水平方向居左对齐
          children: <Widget>[
            Text(
              model.appName, //App名称
              maxLines: 1, //设置1行文本
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            Text(
              model.appDate,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 16, color: Color(0xFF8E8D92)),
            )
          ],
        )),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
          child: FlatButton(
            //按钮背景颜色
            color: Color(0xFFF1F0F7),
            highlightColor: Colors.blue[700],
            colorBrightness: Brightness.dark,
            //圆角
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Text(
              "OPEN",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),

            onPressed: () {
              /** 必须在此处实现点击方法 */
              print('open 按钮被点击了..');
            },
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        )
      ],
    );
  }

  //配置下半部分 UI
  Widget buildBottomRow(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                model.appDescription,
                style: TextStyle(color: Colors.black),
                maxLines: 2,
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    "${model.appVersion} • ${model.appSize} MB",
                    style: TextStyle(color: Colors.black38),
                  ))
            ]));
  }
}

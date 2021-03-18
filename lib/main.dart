import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'custom.dart';
import 'appStoreStudy/AppUpdateItemWidth.dart';
import 'appStoreStudy/AppUpdateItemModel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'App Store'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //设置数据模型
    var model = UpdateItemModel(
        appIcon: 'images/icon_setting_sence_model.png',
        appDescription:
            'Thanks for using Google Maps! This release brings bug fixes that improve our product to help you discover new places and navigate to them.',
        appName: 'Google Maps',
        appSize: '18',
        appDate: '2020-12-12',
        appVersion: 'v1.9');

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: (ListView(
        //配置列表控件
        children: [
          AppUpdateItemWidth(
            model: model,
          ),
        ],
      ))),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

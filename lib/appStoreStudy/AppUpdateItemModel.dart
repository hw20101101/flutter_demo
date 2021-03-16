import 'package:flutter/material.dart';

//定义 App Store 升级 Item 的数据模型
class UpdateItemModel {
  String appIcon;
  String appName;
  String appSize;
  String appDate;
  String appDescription;
  String appVersion;

  //定义构造函数, 使用语法糖为属性赋值
  UpdateItemModel(
      {this.appIcon,
      this.appName,
      this.appSize,
      this.appDate,
      this.appDescription,
      this.appVersion});
}

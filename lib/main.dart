import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;

      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        print(" 单次 Frame 绘制回调 "); // 只回调一次
      });

      WidgetsBinding.instance.addPersistentFrameCallback((timeStamp) {
        print("实时 frame 绘制回调"); // 每帧都回调
      });
    });
  }

  @override
  @mustCallSuper
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this); //注册监听器
  }

  @override
  @mustCallSuper
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this); //移出监听器
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print("$state"); //打印生命周期事件
    if (state == AppLifecycleState.resumed) {
      // do something
    }
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    //定义富文本样式
    TextStyle greenStyle = TextStyle(
        fontWeight: FontWeight.normal, fontSize: 20, color: Colors.green);
    TextStyle redStyle = TextStyle(
        fontWeight: FontWeight.normal, fontSize: 18, color: Colors.red);

    //定义下划线用于复用
    var divider1 = Divider(color: Colors.red);
    var divider2 = Divider(color: Colors.green);

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: CustomScrollView(slivers: <Widget>[
        SliverAppBar(
          //SliverAppBar 作为头图控件
          title: Text('CustomScrollView Demo'), // 标题
          floating: true, // 设置悬浮样式
          flexibleSpace: Image.network(
              "https://i04piccdn.sogoucdn.com/dff1358e060dff68",
              fit: BoxFit.cover), // 设置悬浮头图背景
          expandedHeight: 150, // 头图控件高度
        ),
        SliverList(
          //SliverList 作为列表控件
          delegate: SliverChildBuilderDelegate(
            (context, index) => ListTile(
              title: Text('Item #$index'),
              subtitle: Text('subtitle $index'),
            ), // 列表项创建方法
            childCount: 20, // 列表元素个数
          ),
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

/*

0308 备份代码2

body: ListView(
        scrollDirection: Axis.horizontal,
        itemExtent: 100,
        children: <Widget>[
          Container(color: Colors.white),
          Container(color: Colors.green),
          Container(color: Colors.yellow),
          Container(color: Colors.red)
        ],
      ),
 */

/*
0308 备份代码

body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.blueGrey),
            ),
            Text.rich(
              TextSpan(
                children: <TextSpan>[
                  TextSpan(text: 'android 测试', style: redStyle),
                  TextSpan(text: ' iOS 测试 ', style: greenStyle),
                  TextSpan(text: 'flutter', style: redStyle),
                ]
              ),
              textAlign: TextAlign.center,
            ),  //富文本
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            FadeInImage.assetNetwork(
              placeholder: 'images/girl.jpg',
              image: 'http://img0.pcbaby.com.cn/pcbaby/1211/20/1156867_2011051508044096.jpg',
              fit: BoxFit.contain,
              width: 200,
              height: 200,
            ),
            //加载网络图片
            Image(image: AssetImage("images/girl.jpg"), width:100), //加载本地图片
            //模拟网络图片加载出错
            CachedNetworkImage(imageUrl: "http://xxx/xxx/jpg",
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            )
          ],
        ),
      ),
*/

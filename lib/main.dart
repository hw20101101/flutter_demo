import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'custom.dart';

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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
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
  //_MyHomePageState createState() => _MyHomePageState();
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          body: TabBarView(
            children: [
              ParallelWidget(),
              ScrollNotificationWidget(),
              ScrollControllerWidget(),
              CustomControllerWidget()
            ],
          ),
          bottomNavigationBar: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.home),
                text: '视差',
              ),
              Tab(
                icon: Icon(Icons.rss_feed),
                text: 'notifi',
              ),
              Tab(
                icon: Icon(Icons.perm_identity),
                text: 'controller',
              ),
              Tab(
                icon: Icon(Icons.sanitizer),
                text: '自定义',
              )
            ],
            unselectedLabelColor: Colors.blueGrey,
            labelColor: Colors.blue,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Colors.red,
          ),
        ));
  }
}

class ParallelWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          //页头控件
          title: Text('CustomScrollView demo'),
          floating: true,
          flexibleSpace:
              Image.network('https://i04piccdn.sogoucdn.com/dff1358e060dff68'),
          expandedHeight: 200,
        ),
        SliverList(
            //列表控件
            delegate: SliverChildBuilderDelegate(
                (context, index) => ListTile(title: Text('item #$index')),
                childCount: 100))
      ],
    );
  }
}

class ScrollNotificationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ScrollNotificationWidget demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('AppBar title'),
        ),
        body: NotificationListener<ScrollNotification>(
          onNotification: (scrollNotification) {
            if (scrollNotification is ScrollStartNotification) {
              print('scroll start');
            } else if (scrollNotification is ScrollUpdateNotification) {
              print('scroll update');
            } else if (scrollNotification is ScrollEndNotification) {
              print('scroll end');
            }
          },
          child: ListView.builder(
              itemCount: 30,
              itemBuilder: (context, index) => ListTile(
                    title: Text('index: $index'),
                  )),
        ),
      ),
    );
  }
}

class ScrollControllerWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ScrollControllerState();
  }
}

class _ScrollControllerState extends State<ScrollControllerWidget> {
  ScrollController _controller;
  bool isToTop = false;

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(() {
      if (_controller.offset > 1000) {
        setState(() {
          isToTop = true;
        });
      } else if (_controller.offset < 300) {
        setState(() {
          isToTop = false;
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //定义文本控件的颜色和字体大小
    var textStyle = TextStyle(color: Colors.white, fontSize: 16);

    return Scaffold(
      appBar: AppBar(
        title: Text('scroll controller widget'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Center(
              child: Text(
                'container（容器）在 UI 框架中是一个很常见的概念',
                style: textStyle,
              ), //设置文本的颜色和字体大小
            ),
            padding: EdgeInsets.all(18),
            margin: EdgeInsets.all(40), //外边距
            width: 180,
            height: 240,
            //alignment: Alignment.center, //子widget居中对齐
            decoration: BoxDecoration(
              //设置Container的样式
              color: Colors.red, //背景色
              borderRadius: BorderRadius.circular(10), //圆角
            ),
          ),
          Expanded(
            child: ListView.builder(
              controller: _controller,
              itemCount: 100,
              itemBuilder: (context, index) =>
                  ListTile(title: Text('index : $index')),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose(); //销毁控制器
    super.dispose();
  }
}

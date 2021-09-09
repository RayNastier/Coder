import 'package:flutter/material.dart';
import 'package:hafefly/screens/home/pages/home.dart';
import 'package:hafefly/screens/home/pages/map.dart';
import 'package:hafefly/screens/home/pages/profile.dart';
import 'package:hafefly/screens/home/pages/search.dart';

class HomeWrappePage extends StatefulWidget {
  const HomeWrappePage({Key? key}) : super(key: key);
  @override
  _HomeWrappePageState createState() => _HomeWrappePageState();
}

class MyTabs {
  final String title;
  MyTabs({required this.title});
}

class _HomeWrappePageState extends State<HomeWrappePage>
    with TickerProviderStateMixin {
  final List<MyTabs> _tabs = [
    new MyTabs(title: "Hafefly"),
    new MyTabs(title: "Search"),
    new MyTabs(title: "Map"),
    new MyTabs(title: "Profile")
  ];
  late MyTabs _myHandler;
  late TabController _controller;
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this);
    _myHandler = _tabs[0];
    _controller.addListener(_handleSelected);
  }

  void _handleSelected() {
    setState(() {
      _myHandler = _tabs[_controller.index];
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double tabBarBottomPadding;
    if (width < 400) {
      tabBarBottomPadding = 0;
    } else {
      tabBarBottomPadding = 20;
    }
    return WillPopScope(
      onWillPop: () async => !Navigator.of(context).userGestureInProgress,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: DefaultTabController(
            length: 4,
            child: Scaffold(
              appBar: AppBar(
                title: new Text(
                  _myHandler.title,
                  style: TextStyle(fontFamily: "rum-raising", fontSize: 30),
                ),
                backgroundColor: Color(0xff394180),
              ),
              body: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                controller: _controller,
                children: [HomePage(), SearchPage(), MapView(), ProfilePage()],
              ),
              bottomNavigationBar: Container(
                color: Color(0xff394180),
                padding: EdgeInsets.only(bottom: tabBarBottomPadding),
                child: TabBar(
                  controller: _controller,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.grey[400],
                  indicatorColor: Colors.black,
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(color: Colors.white, width: 7.0),
                    insets: EdgeInsets.fromLTRB(20, 0.0, 20, 42.0),
                  ),
                  tabs: [
                    Tab(icon: Icon(Icons.home)),
                    Tab(icon: Icon(Icons.search)),
                    Tab(icon: Icon(Icons.map)),
                    Tab(icon: Icon(Icons.person)),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}

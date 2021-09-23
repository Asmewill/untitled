import 'package:flutter/material.dart';

///appbar[title,leading,actions,centerTitle,bottom[TabBar[tabs[Tab[child:Text("热门OR推荐")]]]]],body bottomNavigationbar,floatingActionButton,drawlayout
class TabControllerAppBarTabBarTabBarView extends StatefulWidget {
  const TabControllerAppBarTabBarTabBarView({Key? key}) : super(key: key);

  @override
  _AppbarDemoState createState() => _AppbarDemoState();
}

class _AppbarDemoState extends State<TabControllerAppBarTabBarTabBarView>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 8, vsync: this);//固定写法
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();//widget销毁的时候，销毁_tabController
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AppBarDemo"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            print("menu");
          },
        ),
        actions: [
          IconButton(
              onPressed: () {
                print("settings");
              },
              icon: Icon(Icons.settings)),
          IconButton(
              onPressed: () {
                print("search");
              },
              icon: Icon(Icons.search)),
          SizedBox(width: 5)
        ],
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          //设置是否可以滑动
          unselectedLabelColor: Colors.black,
          //未选中时文字颜色
          labelColor: Colors.red,
          //文字颜色
          indicatorColor: Colors.red,
          //底部治时期的颜色
          indicatorSize: TabBarIndicatorSize.label,
          //底部指示器宽度大小
          tabs: [
            Tab(child: Text("热门")),
            Tab(child: Text("推荐")),
            Tab(child: Text("热门")),
            Tab(child: Text("推荐")),
            Tab(child: Text("热门")),
            Tab(child: Text("推荐")),
            Tab(child: Text("热门")),
            Tab(child: Text("推荐")),
          ],
        ),
      ),
      body: TabBarView(controller: _tabController, children: [
        ListView(
          children: [
            ListTile(title: Text("这是热门板块")),
            ListTile(title: Text("这是热门板块")),
            ListTile(title: Text("这是热门板块")),
            ListTile(title: Text("这是热门板块")),
            ListTile(title: Text("这是热门板块")),
          ],
        ),
        ListView(
          children: [
            ListTile(title: Text("这是推荐板块")),
            ListTile(title: Text("这是推荐板块")),
            ListTile(title: Text("这是推荐板块")),
            ListTile(title: Text("这是推荐板块")),
            ListTile(title: Text("这是推荐板块")),
          ],
        ),
        ListView(
          children: [
            ListTile(title: Text("这是热门板块")),
            ListTile(title: Text("这是热门板块")),
            ListTile(title: Text("这是热门板块")),
            ListTile(title: Text("这是热门板块")),
            ListTile(title: Text("这是热门板块")),
          ],
        ),
        ListView(
          children: [
            ListTile(title: Text("这是推荐板块")),
            ListTile(title: Text("这是推荐板块")),
            ListTile(title: Text("这是推荐板块")),
            ListTile(title: Text("这是推荐板块")),
            ListTile(title: Text("这是推荐板块")),
          ],
        ),
        ListView(
          children: [
            ListTile(title: Text("这是热门板块")),
            ListTile(title: Text("这是热门板块")),
            ListTile(title: Text("这是热门板块")),
            ListTile(title: Text("这是热门板块")),
            ListTile(title: Text("这是热门板块")),
          ],
        ),
        ListView(
          children: [
            ListTile(title: Text("这是推荐板块")),
            ListTile(title: Text("这是推荐板块")),
            ListTile(title: Text("这是推荐板块")),
            ListTile(title: Text("这是推荐板块")),
            ListTile(title: Text("这是推荐板块")),
          ],
        ),
        ListView(
          children: [
            ListTile(title: Text("这是热门板块")),
            ListTile(title: Text("这是热门板块")),
            ListTile(title: Text("这是热门板块")),
            ListTile(title: Text("这是热门板块")),
            ListTile(title: Text("这是热门板块")),
          ],
        ),
        ListView(
          children: [
            ListTile(title: Text("这是推荐板块")),
            ListTile(title: Text("这是推荐板块")),
            ListTile(title: Text("这是推荐板块")),
            ListTile(title: Text("这是推荐板块")),
            ListTile(title: Text("这是推荐板块")),
          ],
        ),
      ]),
    );
  }
}

import 'package:flutter/material.dart';
///appbar[title,leading,actions,centerTitle,bottom[TabBar[tabs[Tab[child:Text("热门OR推荐")]]]]],body bottomNavigationbar,floatingActionButton,drawlayout

class DefaultTabControllerAppBarTabBarTabBarView extends StatefulWidget {
  const DefaultTabControllerAppBarTabBarTabBarView({Key? key}) : super(key: key);

  @override
  _AppbarDemoState createState() => _AppbarDemoState();
}

class _AppbarDemoState extends State<DefaultTabControllerAppBarTabBarTabBarView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 8,
        child: Scaffold(
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
              isScrollable: true,//设置是否可以滑动
              unselectedLabelColor: Colors.black,//未选中时文字颜色
              labelColor: Colors.red,//文字颜色
              indicatorColor: Colors.red,//底部治时期的颜色
              indicatorSize:TabBarIndicatorSize.label ,//底部指示器宽度大小
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
          body: TabBarView(children: [
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
        ));
  }
}

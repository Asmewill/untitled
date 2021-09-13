import 'package:flutter/material.dart';

///广场页面
class SquarePage extends StatefulWidget {
  const SquarePage({Key? key}) : super(key: key);

  @override
  _SquarePageState createState() => _SquarePageState();
}

class _SquarePageState extends State<SquarePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 10,
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: TabBar(
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: Colors.red,
                      labelColor: Colors.red,
                      unselectedLabelColor: Colors.black,
                      isScrollable: true,
                        tabs: [
                          Tab(child: Text("热销")),
                          Tab(child: Text("推荐")),
                          Tab(child: Text("推荐")),
                          Tab(child: Text("推荐")),
                          Tab(child: Text("热销")),
                          Tab(child: Text("推荐")),
                          Tab(child: Text("推荐")),
                          Tab(child: Text("推荐")),
                          Tab(child: Text("推荐")),
                          Tab(child: Text("推荐")),
                        ],
                    )
                )
              ],
            ),
          ),
          body: TabBarView(
            children: [
              ListView(
                children: [
                  ListTile(
                    title: Text("这是第一个Tab"),
                  ),
                  ListTile(
                    title: Text("这是第一个Tab"),
                  ),
                  ListTile(
                    title: Text("这是第一个Tab"),
                  ),
                  ListTile(
                    title: Text("这是第一个Tab"),
                  ),
                ],
              ),
              ListView(
                children: [
                  ListTile(
                    title: Text("这是第二个Tab"),
                  ),
                  ListTile(
                    title: Text("这是第二个Tab"),
                  ),
                  ListTile(
                    title: Text("这是第二个Tab"),
                  ),
                  ListTile(
                    title: Text("这是第二个Tab"),
                  ),
                ],
              ),
              ListView(
                children: [
                  ListTile(
                    title: Text("这是第三个Tab"),
                  ),
                  ListTile(
                    title: Text("这是第三个Tab"),
                  ),
                  ListTile(
                    title: Text("这是第三个Tab"),
                  ),
                  ListTile(
                    title: Text("这是第三个Tab"),
                  ),
                ],
              ),
              ListView(
                children: [
                  ListTile(
                    title: Text("这是第四个Tab"),
                  ),
                  ListTile(
                    title: Text("这是第四个Tab"),
                  ),
                  ListTile(
                    title: Text("这是第四个Tab"),
                  ),
                  ListTile(
                    title: Text("这是第四个Tab"),
                  ),
                ],
              ),
              ListView(
                children: [
                  ListTile(
                    title: Text("这是第一个Tab"),
                  ),
                  ListTile(
                    title: Text("这是第一个Tab"),
                  ),
                  ListTile(
                    title: Text("这是第一个Tab"),
                  ),
                  ListTile(
                    title: Text("这是第一个Tab"),
                  ),
                ],
              ),
              ListView(
                children: [
                  ListTile(
                    title: Text("这是第二个Tab"),
                  ),
                  ListTile(
                    title: Text("这是第二个Tab"),
                  ),
                  ListTile(
                    title: Text("这是第二个Tab"),
                  ),
                  ListTile(
                    title: Text("这是第二个Tab"),
                  ),
                ],
              ),
              ListView(
                children: [
                  ListTile(
                    title: Text("这是第三个Tab"),
                  ),
                  ListTile(
                    title: Text("这是第三个Tab"),
                  ),
                  ListTile(
                    title: Text("这是第三个Tab"),
                  ),
                  ListTile(
                    title: Text("这是第三个Tab"),
                  ),
                ],
              ),
              ListView(
                children: [
                  ListTile(
                    title: Text("这是第四个Tab"),
                  ),
                  ListTile(
                    title: Text("这是第四个Tab"),
                  ),
                  ListTile(
                    title: Text("这是第四个Tab"),
                  ),
                  ListTile(
                    title: Text("这是第四个Tab"),
                  ),
                ],
              ),
              ListView(
                children: [
                  ListTile(
                    title: Text("这是第一个Tab"),
                  ),
                  ListTile(
                    title: Text("这是第一个Tab"),
                  ),
                  ListTile(
                    title: Text("这是第一个Tab"),
                  ),
                  ListTile(
                    title: Text("这是第一个Tab"),
                  ),
                ],
              ),
              ListView(
                children: [
                  ListTile(
                    title: Text("这是第二个Tab"),
                  ),
                  ListTile(
                    title: Text("这是第二个Tab"),
                  ),
                  ListTile(
                    title: Text("这是第二个Tab"),
                  ),
                  ListTile(
                    title: Text("这是第二个Tab"),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

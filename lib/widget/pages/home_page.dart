import 'package:flutter/material.dart';
import 'package:untitled/widget/pages/search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 500,
      color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center, //必须有Container父容器包裹才会生效
        children: [
          ElevatedButton(
              onPressed: () {
                ///普通路由跳转
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return SearchPage(arguments: {"id":'6666'});
                }));
              },
              child: Text("普通路由跳转传值:跳转到搜索界面")
          ),
          SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                ///命名路由跳转
                Navigator.pushNamed(context, '/search',arguments: {
                  "id":'64423'
                  }
                );
              },
              child: Text("命名路由跳转传值:跳转到搜索界面")
          ),
          SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                ///命名路由跳转
                Navigator.pushNamed(context, '/product');
              },
              child: Text("命名路由跳转:跳转到商品页面")
          ),
          SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                ///命名路由跳转
                Navigator.pushNamed(context, '/appbar_demo');
              },
              child: Text("AppBarDemo")
          ),

        ],
      ),
    );
  }
}

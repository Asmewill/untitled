
import 'package:flutter/material.dart';
import 'package:untitled/widget/pages/category_page.dart';
import 'package:untitled/widget/pages/home_page.dart';
import 'package:untitled/widget/pages/setting_page.dart';


/// 命名路由
/// 命名路由传值
class ScaffoldBottomNavigationBar2 extends StatefulWidget {
  const ScaffoldBottomNavigationBar2({Key? key}) : super(key: key);

  @override
  _ScaffoldBottomNavigationBarState createState() => _ScaffoldBottomNavigationBarState();
}

class _ScaffoldBottomNavigationBarState extends State<ScaffoldBottomNavigationBar2> {
  int _currentIndex=0;
  List<Widget> listPage=[
    HomePage(),
    CategoryPage(),
    SettingPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Demo"),
      ),
      body:listPage[this._currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: this._currentIndex,
          onTap: (index){
            setState(() {
              this._currentIndex=index;
            });
          },
          //  type: BottomNavigationBarType.fixed,//当BottomNavigationBarItem>3时，必须设置
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "首页"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.category),
                label: "分类"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: "设置"
            )
          ]
      ),
    );
  }
}

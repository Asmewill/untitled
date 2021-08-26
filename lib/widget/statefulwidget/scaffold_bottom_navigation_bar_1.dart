
import 'package:flutter/material.dart';
import 'package:untitled/widget/pages/category_page.dart';
import 'package:untitled/widget/pages/home_page.dart';
import 'package:untitled/widget/pages/setting_page.dart';
import 'package:untitled/widget/pages/square_page.dart';


/// 普通路由
/// 普通路由传值
class ScaffoldBottomNavigationBar1 extends StatefulWidget {
  final int index;
  const ScaffoldBottomNavigationBar1({this.index=0,Key? key}) : super(key: key);

  @override
  _ScaffoldBottomNavigationBarState createState() => _ScaffoldBottomNavigationBarState(this.index);
}

class _ScaffoldBottomNavigationBarState extends State<ScaffoldBottomNavigationBar1> {
  int _currentIndex=0;
  _ScaffoldBottomNavigationBarState(this._currentIndex);
  List<Widget> listPage=[
    HomePage(),
    CategoryPage(),
    SettingPage(),
    SquarePage()
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
          type: BottomNavigationBarType.fixed,//当BottomNavigationBarItem>3时，必须设置
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
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.sanitizer),
                label: "广场"
            )
          ]
      ),
    );
  }
}

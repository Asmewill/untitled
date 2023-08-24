import 'package:flutter/material.dart';
import 'package:untitled/jdshop/pages/cart_page.dart';
import 'package:untitled/jdshop/pages/category_page.dart';
import 'package:untitled/jdshop/pages/home_page.dart';
import 'package:untitled/jdshop/pages/mine_page.dart';



class Tabs extends StatefulWidget {
  const Tabs({Key? key}) : super(key: key);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  List<Widget> listPage = [HomePage(), CategoryPage(), CartPage(), MinePage()];
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);//设置最开始显示的页面
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: listPage,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: "分类"),
          BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard), label: "购物车"),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: "我的"),
        ],
        currentIndex: _currentIndex,
        fixedColor: Colors.red,
        onTap: (index) {
          setState(() {
            print("currentIndex:${index}");
            //this._currentIndex = index;
            _pageController.jumpToPage(index);
          });
        },
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

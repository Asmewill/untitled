import 'package:flutter/material.dart';
import 'package:untitled/jdshop/pages/car_page.dart';
import 'package:untitled/jdshop/pages/category_page.dart';
import 'package:untitled/jdshop/pages/home_page.dart';
import 'package:untitled/jdshop/pages/mine_page.dart';
import 'package:untitled/jdshop/pages/search_page.dart';

class Tabs extends StatefulWidget {
  const Tabs({Key? key}) : super(key: key);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  List<Widget> listPage = [HomePage(), CategoryPage(), CarPage(), MinePage()];
  int _currentIndex = 1;
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
      appBar:_currentIndex==3? AppBar(
        title: Text("jsshop"),
      ):AppBar(
        leading: IconButton(
          icon: Icon(Icons.center_focus_weak),
          onPressed: () {
          },
        ),
        title:InkWell(
          onTap: (){
             Navigator.of(context).push(MaterialPageRoute(builder: (context){
               return SearchPage();
             }));
          },
          child:  Container(
            padding: EdgeInsets.only(left: 10),
            height: 40,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(23),
                color: Colors.black12
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.search,size:18,color: Colors.black26,),
                Container(
                  margin: EdgeInsets.only(left:2,bottom: 2),
                  child: Text("笔记本",style: TextStyle(fontSize: 16,color: Colors.black26)),
                )

              ],
            ),
          ),
        ),
        actions: [
          IconButton(onPressed: (){
          }, icon: Icon(Icons.message))
        ],
      ),

      ///IndexedStack 和 Stack 一样，都是层布局控件，
      ///可以在一个控件上面放置另一 个控件，但唯一不同的是 IndexedStack
      ///在同一时刻只能显示子控件中的一个控 件，通过 Index 属性来设置显示的控件
      ///IndexedStack 来保持页面状态的优点就是配置简单。IndexedStack
      ///保持页面状 态的缺点就是不方便单独控制每个页面的状态
     // body: listPage[_currentIndex],
      // body: IndexedStack(
      //   index: this._currentIndex,
      //   children: listPage,
      // ),
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

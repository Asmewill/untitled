import 'package:flutter/material.dart';
import 'package:untitled/widget/button_demo.dart';
import 'package:untitled/widget/pages/provider_demo_page.dart';
import 'package:untitled/widget/pages/search_page.dart';
import 'package:untitled/widget/statefulwidget/checkbox_demo.dart';
import 'package:untitled/widget/statefulwidget/drawer_drawer_header.dart';
import 'package:untitled/widget/statefulwidget/drawer_useraccouts_drawer_header.dart';
import 'package:untitled/widget/statefulwidget/textfield_demo.dart';
import 'package:untitled/widget/statefulwidget/textfield_demo_2.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  ListView(
      padding: EdgeInsets.all(20),
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
              Navigator.pushNamed(context, '/default_tabcontrol_appbar_tabbar_tabbarview');
            },
            child: Text("DefaultTabControllerAppBarTabBarTabBarView")
        ),
        SizedBox(height: 20),
        ElevatedButton(
            onPressed: () {
              ///命名路由跳转
              Navigator.pushNamed(context, '/tabcontrol_appbar_tabbar_tabbarview');
            },
            child: Text("TabControllerAppBarTabBarTabBarView")
        ),
        SizedBox(height: 20),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                 return DrawerDrawerHeader();
              }));
            },
            child: Text("DrawerDrawerHeader")
        ),
        SizedBox(height: 20),
        ElevatedButton(
            onPressed: () {
             Navigator.of(context).push(MaterialPageRoute(builder: (context){
               return DrawerUserAccountsDrawerHeader();
             }));
            },
            child: Text("DrawerUserAccountsDrawerHeader")
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return ButtonDemo();
              }));
            },
            child: Text("按钮演示页面")
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return TextFiledDemo();
              }));
            },
            child: Text("文本输入框演示页面")
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return CheckBoxDemo();
              }));
            },
            child: Text("CheckBox复选框演示页面")
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return TextFieldDemo2();
              }));
            },
            child: Text("文本输入框演示页面二")
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return ProviderDemoPage();
              }));
            },
            child: Text("Provider功能演示")
        ),
      ],
    );
  }
}

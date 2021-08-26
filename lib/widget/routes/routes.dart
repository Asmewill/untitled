import 'package:flutter/material.dart';
import 'package:untitled/widget/pages/form_page.dart';
import 'package:untitled/widget/pages/login_page.dart';
import 'package:untitled/widget/pages/product_info_page.dart';
import 'package:untitled/widget/pages/product_page.dart';
import 'package:untitled/widget/pages/register_first_page.dart';
import 'package:untitled/widget/pages/register_second_page.dart';
import 'package:untitled/widget/pages/register_thrid_page.dart';
import 'package:untitled/widget/pages/search_page.dart';
import 'package:untitled/widget/statefulwidget/appbar_demo.dart';
import 'package:untitled/widget/statefulwidget/scaffold_bottom_navigation_bar_1.dart';

///配置路由,定义Map类型的routes,Key为String类型，Value为Function类型
final Map<String ,Function>  routes={
  '/':(context)=>ScaffoldBottomNavigationBar1(),
  '/form':(context)=>FormPage(),
  '/search':(context,{dynamic arguments})=>SearchPage(arguments:arguments),//dynamic可以去掉，默认是这种类型
  '/product':(context)=>ProductPage(),
  '/product_info':(context,{arguments})=>ProductInfoPage(arguments:arguments),
  '/login':(context)=>LoginPage(),
  '/register_first':(context)=>RegisterFirstPage(),
  '/register_second':(context)=>RegisterSecondPage(),
  '/register_thrid':(context)=>RegisterThridPage(),
  '/appbar_demo':(context)=>AppBarDemo(),
};

///固定写法
dynamic onGenerateRoute=(RouteSettings settings) {
  ///String? 表示name为可空类型
  final String? name = settings.name;
  ///Function? 表示pageContentBuilder为可空类型
  final Function? pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    }else{
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context));
      return route;
    }
  }
};

